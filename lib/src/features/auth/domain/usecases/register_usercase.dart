import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/auth/domain/entities/register_entite.dart';
import 'package:clinic_app/src/features/auth/domain/repositories/auth_repostiores.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  AuthRepostiores authRepostoires;
  RegisterUseCase({required this.authRepostoires});
  Future<Either<Failure, RegisterEntite>> call(
      {required Map<String, dynamic>data}) async {
    return await authRepostoires.registerRepo(data);
  }
}
