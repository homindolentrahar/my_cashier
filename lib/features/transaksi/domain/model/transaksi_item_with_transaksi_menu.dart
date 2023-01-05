import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi.dart';

class TransaksiDetail {
  final Transaksi? transaksi;
  final Menu? menu;
  final int? quantity;
  final double? subtotal;

  TransaksiDetail({
    this.menu,
    this.transaksi,
    this.quantity,
    this.subtotal,
  });
}
