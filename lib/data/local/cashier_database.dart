import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:my_cashier/features/auth/domain/model/admin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'package:my_cashier/features/auth/data/entity/admin_entity.dart';
part 'cashier_database.g.dart';

@DriftDatabase(tables: [Admins])
class CashierDatabase extends _$CashierDatabase {
  CashierDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
