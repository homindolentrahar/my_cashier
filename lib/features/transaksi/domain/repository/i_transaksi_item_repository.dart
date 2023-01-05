import 'package:dartz/dartz.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item_with_transaksi_menu.dart';

abstract class ITransaksiItemRepository {
  Future<Either<String, Unit>> createOrder(List<TransaksiDetail> order);
}
