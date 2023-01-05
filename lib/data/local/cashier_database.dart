import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'cashier_database.g.dart';

@DriftDatabase(tables: [Admins, Menus, Transactions, TransactionItems])
class CashierDatabase extends _$CashierDatabase {
  CashierDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

@DataClassName('AdminEntity')
class Admins extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text().withLength(min: 3)();
  TextColumn get email => text().unique()();
  TextColumn get password => text().withLength(min: 8)();
}

@DataClassName('MenuEntity')
class Menus extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idAdmin => integer().references(Admins, #id)();
  TextColumn get nama => text().withLength(min: 3)();
  TextColumn get description => text().nullable()();
  RealColumn get harga => real()();
  IntColumn get stock => integer()();
}

@DataClassName('TransactionEntity')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idAdmin => integer().references(Admins, #id)();
  DateTimeColumn get tanggal =>
      dateTime().withDefault(Constant(DateTime.now()))();
  // IntColumn get total => integer()();
}

@DataClassName('TransactionItemEntity')
class TransactionItems extends Table {
  IntColumn get idTransaksi => integer().references(Transactions, #id)();
  IntColumn get idMenu => integer().references(Menus, #id)();
  IntColumn get quantity => integer()();
  RealColumn get subtotal => real()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
