import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/company/domain/entities/company_entite.dart';
import 'package:clinic_app/src/features/company/domain/repositories/company_repostiore.dart';
import 'package:dartz/dartz.dart';

class CompanyUsecase {
  CompanyRepostiores companyRepostiores;
  CompanyUsecase({required this.companyRepostiores});

 Future<Either<Failure,List<CompanyEntite>>> call() async {
    return await companyRepostiores.getAllCompany();
  }
}
