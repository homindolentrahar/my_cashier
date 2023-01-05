import 'package:dartz/dartz.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';

abstract class IMenuRepository {
  Stream<Either<String, List<Menu>>> watchAllMenus();
  Stream<Either<String, Menu>> watchSingleMenu(int id);
  Future<Either<String, Unit>> createMenu(Menu data);
  Future<Either<String, Unit>> updateMenu({
    required int id,
    required Menu data,
  });
  Future<Either<String, Unit>> deleteMenu(int id);
}
