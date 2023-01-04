import 'package:dartz/dartz.dart';
import 'package:my_cashier/features/auth/domain/model/admin.dart';

abstract class IAuthRepository {
  Future<Option<Admin>> checkAuthenticated();

  Future<Either<String, Unit>> login({
    required String email,
    required String password,
  });

  Future<Either<String, Unit>> register({
    required String email,
    required String password,
  });
}
