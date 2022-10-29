import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/cores/networkinfo.dart';
import 'package:clinic_app/src/features/clinics/data/datasources/remote_datasourse_clinic.dart';
import 'package:clinic_app/src/features/clinics/domain/entities/clinic_entite.dart';
import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/clinics/domain/repositories/clinic_repostiores.dart';
import 'package:dartz/dartz.dart';

class ClinicRepostioresImp extends ClinicRepostiores {
  NetworkInfo networkInfo;
  RemoteDataSourseClinic remoteDataSourseClinic;
  ClinicRepostioresImp(
      {required this.networkInfo, required this.remoteDataSourseClinic});
  @override
  Future<Either<Failure, List<ClinicEntit>>> getAllClinics() async {
    if (await networkInfo.checkInternet()) {
      try {
        final remote = await remoteDataSourseClinic.getAllClinicsDataSourse();
        return Right(remote);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
