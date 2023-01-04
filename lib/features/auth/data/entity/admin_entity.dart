part of 'package:my_cashier/data/local/cashier_database.dart';

@DataClassName('AdminEntity')
class Admins extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text().withLength(min: 3)();
  TextColumn get email => text().unique()();
  TextColumn get password => text().withLength(min: 8)();
}

extension AdminsExt on AdminEntity {
  Admin toModel() => Admin(
        id: id,
        nama: nama,
        email: email,
        password: password,
      );
}
