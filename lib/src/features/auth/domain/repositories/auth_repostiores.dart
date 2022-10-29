import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/auth/domain/entities/login_entite.dart';
import 'package:clinic_app/src/features/auth/domain/entities/register_entite.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepostiores {
  Future<Either<Failure, RegisterEntite>> registerRepo(Map<String, dynamic>data);
  Future<Either<Failure, LoginEntite>> loginRepo(Map<String, dynamic>data);
}
