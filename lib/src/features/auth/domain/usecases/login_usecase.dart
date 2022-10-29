import 'package:clinic_app/src/features/auth/domain/entities/login_entite.dart';
import 'package:clinic_app/src/features/auth/domain/repositories/auth_repostiores.dart';
import 'package:dartz/dartz.dart';
import '../../../../cores/errors/failure.dart';

class LoginUseCase {
  AuthRepostiores authRepostoires;
  LoginUseCase({required this.authRepostoires});

  Future<Either<Failure, LoginEntite>> call( {required Map<String, dynamic>data}) async {
    return await authRepostoires.loginRepo(data);
  }
}
