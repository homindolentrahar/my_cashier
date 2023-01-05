import 'package:my_cashier/features/transaksi/domain/model/transaksi.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item.dart';

class TransaksiWithDetails {
  final Transaksi? transaksi;
  final List<DetailTransaksi>? details;

  TransaksiWithDetails({
    this.transaksi,
    this.details,
  });
}
