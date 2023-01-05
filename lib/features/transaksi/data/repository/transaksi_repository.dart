import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:my_cashier/data/local/cashier_database.dart';
import 'package:dartz/dartz.dart';
import 'package:my_cashier/util/extension/entity_extension.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item_with_transaksi_menu.dart';
import 'package:my_cashier/features/transaksi/domain/repository/i_transaksi_repository.dart';
import 'package:my_cashier/util/helper/secure_storage_helper.dart';

class TransaksiRepository implements ITransaksiRepository {
  final CashierDatabase database;

  TransaksiRepository(this.database);

  @override
  Stream<Either<String, List<Transaksi>>> watchAllTransactions() async* {
    final savedCredential =
        await SecureStorageHelper.instance.getUserCredential();
    yield* (database.select(database.transactions)
          ..where(
            (tbl) => tbl.idAdmin.equals(savedCredential?['id'] ?? 0),
          ))
        .watch()
        .map((data) {
      return right<String, List<Transaksi>>(
        data.map((e) => e.toModel()).toList(),
      );
    }).onErrorReturnWith((error, stackTrace) {
      Logger().e("Error: ${error.toString()}");
      return left(error.toString());
    });
  }

  @override
  Future<Either<String, Unit>> createTransaksi(
    List<TransaksiDetail> details,
  ) async {
    try {
      return database.transaction(() async {
        final savedCredential =
            await SecureStorageHelper.instance.getUserCredential();

        final transaksi = TransactionsCompanion(
          idAdmin: Value(savedCredential?['id'] ?? 0),
          tanggal: Value(DateTime.now()),
        );

        final transaksiId =
            await database.into(database.transactions).insert(transaksi);

        for (final detail in details) {
          final transaksiItem = TransactionItemsCompanion(
            idMenu: Value(detail.menu?.id ?? 0),
            idTransaksi: Value(transaksiId),
            quantity: Value(detail.quantity ?? 0),
            subtotal: Value(detail.subtotal ?? 0),
          );
          final menuItem = MenusCompanion(
            stock: Value((detail.menu?.stock ?? 0) - (detail.quantity ?? 0)),
          );

          await (database.update(database.menus)
                ..where((tbl) => tbl.id.equals(detail.menu?.id ?? 0)))
              .write(menuItem);
          await database.into(database.transactionItems).insert(transaksiItem);
        }

        return right(unit);
      });
    } catch (e) {
      Logger().e("Error: ${e.toString()}");
      return left("Terjadi kesalahan");
    }
  }

  @override
  Future<Either<String, Unit>> deleteTransaksi(int id) async {
    try {
      await (database.delete(database.transactions)
            ..where((tbl) => tbl.id.equals(id)))
          .go();

      return right(unit);
    } catch (e) {
      Logger().e("Error: ${e.toString()}");
      return left("Terjadi kesalahan");
    }
  }
}
