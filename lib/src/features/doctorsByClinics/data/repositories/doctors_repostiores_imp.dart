import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/cores/networkinfo.dart';
import 'package:clinic_app/src/features/doctorsByClinics/data/datasources/remote_datasourse_doctors.dart';
import 'package:clinic_app/src/features/doctorsByClinics/domain/entities/doctor_entite.dart';
import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/doctorsByClinics/domain/repositories/doctors_repostories.dart';
import 'package:dartz/dartz.dart';

class DoctorsRepostoriesImp extends DoctorsRepostiores {
  NetworkInfo networkInfo;
  RemoteDataSourseDoctors remoteDataSourseDoctors;
  DoctorsRepostoriesImp(
      {required this.networkInfo, required this.remoteDataSourseDoctors});
  @override
  Future<Either<Failure, List<DoctorEntite>>> getAllDoctors(
      {required int id}) async {
   
      try {
        final remote =
            await remoteDataSourseDoctors.getAllDoctorseRemote(id: id);
        return Right(remote);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
   
  }
}
