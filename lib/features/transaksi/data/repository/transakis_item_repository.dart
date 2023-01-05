import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:my_cashier/data/local/cashier_database.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item_with_transaksi_menu.dart';
import 'package:my_cashier/features/transaksi/domain/repository/i_transaksi_item_repository.dart';

class TransaksiItemRepository implements ITransaksiItemRepository {
  final CashierDatabase database;

  TransaksiItemRepository(this.database);

  @override
  Future<Either<String, Unit>> createOrder(List<TransaksiDetail> orders) async {
    try {
      return right(unit);
    } catch (e) {
      Logger().e("Error: ${e.toString()}");
      return left("Terjadi kesalahan");
    }
  }
}
