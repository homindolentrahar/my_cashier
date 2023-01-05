import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:my_cashier/data/local/cashier_database.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:my_cashier/features/menu/domain/repository/i_menu_repository.dart';
import 'package:my_cashier/util/helper/secure_storage_helper.dart';
import 'package:my_cashier/util/extension/entity_extension.dart';

class MenuRepository implements IMenuRepository {
  final CashierDatabase database;

  MenuRepository(this.database);

  @override
  Future<Either<String, Unit>> createMenu(Menu data) async {
    try {
      final savedCredential =
          await SecureStorageHelper.instance.getUserCredential();
      final menu = MenusCompanion(
        idAdmin: Value(savedCredential?['id'] ?? 0),
        nama: Value(data.nama ?? ""),
        description: Value(data.description ?? ""),
        harga: Value(data.harga ?? 0),
        stock: Value(data.stock ?? 0),
      );
      await database.into(database.menus).insert(menu);

      return right(unit);
    } catch (e) {
      Logger().e("Error: ${e.toString()}");
      return left("Terjadi kesalahan");
    }
  }

  @override
  Future<Either<String, Unit>> deleteMenu(int id) async {
    try {
      await (database.delete(database.menus)..where((tbl) => tbl.id.equals(id)))
          .go();

      return right(unit);
    } catch (e) {
      Logger().e("Error: ${e.toString()}");
      return left("Terjadi kesalahan");
    }
  }

  @override
  Future<Either<String, Unit>> updateMenu({
    required int id,
    required Menu data,
  }) async {
    try {
      final savedCredential =
          await SecureStorageHelper.instance.getUserCredential();
      final menu = MenusCompanion(
        idAdmin: Value(savedCredential?['id'] ?? 0),
        nama: Value(data.nama ?? ""),
        description: Value(data.description ?? ""),
        harga: Value(data.harga ?? 0),
        stock: Value(data.stock ?? 0),
      );

      await (database.update(database.menus)..where((tbl) => tbl.id.equals(id)))
          .write(menu);

      return right(unit);
    } catch (e) {
      Logger().e("Error: ${e.toString()}");
      return left("Terjadi kesalahan");
    }
  }

  @override
  Stream<Either<String, List<Menu>>> watchAllMenus() async* {
    final savedCredential =
        await SecureStorageHelper.instance.getUserCredential();
    yield* (database.select(database.menus)
          ..where(
            (tbl) => tbl.idAdmin.equals(savedCredential?['id'] ?? 0),
          ))
        .watch()
        .map((data) {
      return right<String, List<Menu>>(
        data.map((e) => e.toModel()).toList(),
      );
    }).onErrorReturnWith((error, stackTrace) {
      Logger().e("Error: ${error.toString()}");
      return left(error.toString());
    });
  }

  @override
  Stream<Either<String, Menu>> watchSingleMenu(int id) async* {
    yield* (database.select(database.menus)..where((tbl) => tbl.id.equals(id)))
        .watchSingle()
        .map((data) {
      return right<String, Menu>(data.toModel());
    }).onErrorReturnWith((error, stackTrace) {
      Logger().e("Error: ${error.toString()}");
      return left(error.toString());
    });
  }
}
