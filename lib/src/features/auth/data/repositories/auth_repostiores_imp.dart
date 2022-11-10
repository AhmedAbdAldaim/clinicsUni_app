import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/cores/networkinfo.dart';
import 'package:clinic_app/src/features/auth/data/datasources/remote/remote_datasourse_auth.dart';
import 'package:clinic_app/src/features/auth/data/models/register_model.dart';
import 'package:clinic_app/src/features/auth/domain/entities/register_entite.dart';
import 'package:clinic_app/src/features/auth/domain/entities/login_entite.dart';
import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/auth/domain/repositories/auth_repostiores.dart';
import 'package:dartz/dartz.dart';

class AuthRepostioriesImp extends AuthRepostiores {
  NetworkInfo networkInfo;
  RemoteDataSouresAuth remoteDataSoures;
  AuthRepostioriesImp(
      {required this.networkInfo, required this.remoteDataSoures});

  @override
  Future<Either<Failure, LoginEntite>> loginRepo(
      Map<String, dynamic> data) async {
      try {
        final remote = await remoteDataSoures.loginDataSourses(data);
        return Right(remote);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    
  }

  @override
  Future<Either<Failure, RegisterEntite>> registerRepo(
      Map<String, dynamic> data) async {
    if (await networkInfo.checkInternet()) {
      try {
        final remote = await remoteDataSoures.registerDataSourses(data);
        return Right(remote);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
