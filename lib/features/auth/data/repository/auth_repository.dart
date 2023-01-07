import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:encrypt/encrypt.dart';
import 'package:logger/logger.dart';
import 'package:my_cashier/data/local/cashier_database.dart';
import 'package:my_cashier/features/auth/domain/model/admin.dart';
import 'package:my_cashier/features/auth/domain/repository/i_auth_repository.dart';
import 'package:my_cashier/util/helper/secure_storage_helper.dart';
import 'package:my_cashier/util/extension/entity_extension.dart';

class AuthRepository implements IAuthRepository {
  final CashierDatabase database;

  AuthRepository(this.database);

  get hashPassword => null;

  @override
  Future<Option<Admin>> checkAuthenticated() async {
    final savedCredential =
        await SecureStorageHelper.instance.getUserCredential();

    Logger().i("Saved Credential: $savedCredential");

    final admin = await (database.select(database.admins)
          ..where((tbl) => tbl.email.equals(savedCredential?['email'] ?? "")))
        .getSingleOrNull();

    return optionOf(admin?.toModel());
  }

  @override
  Future<Either<String, Unit>> login(
      {required String email, required String password}) async {
    try {
      final existedAdmin = await (database.select(database.admins)
            ..where((tbl) => tbl.email.equals(email)))
          .getSingleOrNull();

      if (existedAdmin != null) {
        // Decrypt the password
        final existedPassword = existedAdmin.password;
        final key = Key.fromLength(32);
        final iv = IV.fromLength(16);

        final encryptor = Encrypter(AES(key));
        final decryptedPassword = encryptor.decrypt64(existedPassword, iv: iv);

        Logger().w(
          "Saved Password: $password\nInput Password: $decryptedPassword\nSame: ${password == decryptedPassword}",
        );

        if (password == decryptedPassword) {
          SecureStorageHelper.instance.saveUserCredential(
            id: existedAdmin.id,
            email: existedAdmin.email,
          );

          return right(unit);
        } else {
          return left("Kombinasi email dan password salah!");
        }
      } else {
        return left("Admin belum terdaftar. Silahkan daftar dulu");
      }
    } catch (e) {
      return left("Terjadi kesalahan");
    }
  }

  @override
  Future<Either<String, Unit>> register(
      {required String email, required String password}) async {
    try {
      final existedAdmin = await (database.select(database.admins)
            ..where((tbl) => tbl.email.equals(email)))
          .getSingleOrNull();

      if (existedAdmin == null) {
        // Encrypt the password
        final key = Key.fromLength(32);
        final iv = IV.fromLength(16);

        final encryptor = Encrypter(AES(key));
        final encryptedPassword = encryptor.encrypt(password, iv: iv);

        final data = AdminsCompanion(
          email: Value(email),
          password: Value(encryptedPassword.base64),
          nama: Value(email),
        );

        Logger().w("Auth: ${data.toColumns(false)}");

        await database.into(database.admins).insert(data);

        // TODO: Auto-redirect when sign up
        // final admin = await (database.select(database.admins)
        //       ..where((tbl) => tbl.email.equals(email)))
        //     .getSingleOrNull();
        // SecureStorageHelper.instance.saveUserCredential(
        //   id: admin?.id ?? 0,
        //   email: admin?.email ?? "",
        // );

        return right(unit);
      } else {
        return left("Admin telah terdaftar");
      }
    } catch (e) {
      Logger().e(e.toString());
      return left("Terjadi kesalahan");
    }
  }
}
