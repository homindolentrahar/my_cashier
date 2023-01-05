import 'package:my_cashier/data/local/cashier_database.dart';
import 'package:my_cashier/features/auth/domain/model/admin.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';

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
