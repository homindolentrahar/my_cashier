import 'package:my_cashier/data/local/cashier_database.dart';
import 'package:my_cashier/features/auth/domain/model/admin.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item.dart';

extension AdminsExt on AdminEntity {
  Admin toModel() => Admin(
        id: id,
        nama: nama,
        email: email,
        password: password,
      );
}

extension MenusExt on MenuEntity {
  Menu toModel() => Menu(
        id: id,
        idAdmin: idAdmin,
        nama: nama,
        description: description,
        harga: harga,
        stock: stock,
      );
}

extension TransactionsExt on TransactionEntity {
  Transaksi toModel() => Transaksi(
        idTransaksi: id,
        idAdmin: idAdmin,
        tanggal: tanggal,
      );
}

extension TransactionItemsExt on TransactionItemEntity {
  TransaksiItem toModel() => TransaksiItem(
      idMenu: idMenu,
      idTransaksi: idTransaksi,
      quantity: quantity,
      subtotal: subtotal);
}
