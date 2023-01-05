import 'package:dartz/dartz.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item_with_transaksi_menu.dart';

abstract class ITransaksiRepository {
  Stream<Either<String, List<Transaksi>>> watchAllTransactions();

  Future<Either<String, Unit>> createTransaksi(
    List<TransaksiDetail> details,
  );

  Future<Either<String, Unit>> deleteTransaksi(int id);
}
