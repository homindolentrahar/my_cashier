import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:logger/logger.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item.dart';
import 'package:my_cashier/model/transaksi_with_menu.dart';
import 'package:my_cashier/util/extension/entity_extension.dart';
import 'package:my_cashier/util/helper/secure_storage_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';

part 'cashier_database.g.dart';

@DriftDatabase(tables: [Admins, Menus, Transactions, TransactionItems])
class CashierDatabase extends _$CashierDatabase {
  CashierDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<Either<String, List<TransaksiWithDetails>>>
      watchAllTransactions() async* {
    final savedCredential =
        await SecureStorageHelper.instance.getUserCredential();

    final transactionQuery = select(transactions)
      ..where((tbl) => tbl.idAdmin.equals(savedCredential?['id'] ?? 0));

    yield* transactionQuery.watch().switchMap((txs) {
      final idToTransaction = {for (final tx in txs) tx.id: tx};
      final ids = idToTransaction.keys;

      final joinQuery = select(transactionItems).join([
        innerJoin(transactions,
            transactions.id.equalsExp(transactionItems.idTransaksi)),
        innerJoin(menus, menus.id.equalsExp(transactionItems.idMenu)),
      ])
        ..where(transactionItems.idTransaksi.isIn(ids));

      return joinQuery.watch().map((rows) {
        final idToItems = <int, List<DetailTransaksi>>{};

        Logger().w(rows.map((e) => e.rawData.data).toList());

        for (final row in rows) {
          final item = DetailTransaksi(
            menu: row.readTable(menus).toModel(),
            quantity: row.readTable(transactionItems).quantity,
            subtotal: row.readTable(transactionItems).subtotal,
          );
          final id = row.readTable(transactionItems).idTransaksi;

          idToItems.putIfAbsent(id, () => []).add(item);
        }

        return right<String, List<TransaksiWithDetails>>(
          ids
              .map(
                (id) => TransaksiWithDetails(
                  transaksi: idToTransaction[id]?.toModel(),
                  details: idToItems[id],
                ),
              )
              .toList(),
        );
      });
    }).onErrorReturnWith((error, stackTrace) {
      Logger().e("Error: ${error.toString()}");
      return left(error.toString());
    });
  }
}

@DataClassName('AdminEntity')
class Admins extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text().withLength(min: 3)();
  TextColumn get email => text().unique()();
  TextColumn get password => text().withLength(min: 8)();
}

@DataClassName('MenuEntity')
class Menus extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idAdmin => integer().references(Admins, #id)();
  TextColumn get nama => text().withLength(min: 3)();
  TextColumn get description => text().nullable()();
  RealColumn get harga => real()();
  IntColumn get stock => integer()();
}

@DataClassName('TransactionEntity')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idAdmin => integer().references(Admins, #id)();
  DateTimeColumn get tanggal =>
      dateTime().withDefault(Constant(DateTime.now()))();
  // IntColumn get total => integer()();
}

@DataClassName('TransactionItemEntity')
class TransactionItems extends Table {
  IntColumn get idTransaksi => integer().references(Transactions, #id)();
  IntColumn get idMenu => integer().references(Menus, #id)();
  IntColumn get quantity => integer()();
  RealColumn get subtotal => real()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
