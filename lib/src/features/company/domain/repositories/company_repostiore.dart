import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/company/domain/entities/company_entite.dart';
import 'package:dartz/dartz.dart';

abstract class CompanyRepostiores {
  Future<Either<Failure, List<CompanyEntite>>> getAllCompany();
}
