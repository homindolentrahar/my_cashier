import 'package:my_cashier/features/menu/domain/model/menu.dart';

class TransaksiItem {
  final int? idTransaksi;
  final int? idMenu;
  final int? quantity;
  final double? subtotal;

  TransaksiItem({
    this.idTransaksi,
    this.idMenu,
    this.quantity,
    this.subtotal,
  });
}

class DetailTransaksi {
  final Menu? menu;
  final int? quantity;
  final double? subtotal;

  DetailTransaksi({
    this.menu,
    this.quantity,
    this.subtotal,
  });
}
