import 'package:clinic_app/src/cores/networkinfo.dart';
import 'package:clinic_app/src/features/company/data/datasources/remote/remote_datasours.dart';
import 'package:clinic_app/src/features/company/domain/entities/company_entite.dart';
import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/company/domain/repositories/company_repostiore.dart';
import 'package:dartz/dartz.dart';

class CompanyRepostioresImp extends CompanyRepostiores {
  final NetworkInfo networkInfo;
  final RemoteDataSoures remoteDataSoures;
  CompanyRepostioresImp(
      {required this.networkInfo, required this.remoteDataSoures});

  @override
  Future<Either<Failure, List<CompanyEntite>>> getAllCompany() async {
    if (await networkInfo.checkInternet()) {
      try {
        final remote = await remoteDataSoures.getAllCompanyDataSourses();
        return Right(remote);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
