import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/cores/networkinfo.dart';
import 'package:clinic_app/src/features/reservation_result/data/datasources/remote_datat_sourser_reservation_result.dart';
import 'package:clinic_app/src/features/reservation_result/domain/entities/reservation_result_by_id_entite.dart';
import 'package:dartz/dartz.dart';

import 'package:clinic_app/src/features/reservation_result/domain/entities/reservation_result_entite.dart';

import 'package:clinic_app/src/cores/errors/failure.dart';

import '../../domain/repositories/reservation_result_repostiores.dart';

class ReservationResultImp extends ReservatioResultRepostiores {
  NetworkInfo networInfo;
  RemoteDataSourseRervationResult remoteDataSourseRervationResult;

  ReservationResultImp(
      {required this.networInfo,
      required this.remoteDataSourseRervationResult});

  @override
  Future<Either<Failure, List<ReservatioResultEntite>>>
      getAllReservationResult() async {
      try {
        final remote =
            await remoteDataSourseRervationResult.getAllRersvationResult();
        return Right(remote);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
   
  }

  @override
  Future<Either<Failure, List<ReservationResultByIdEntite>>> 
  getAllReservationResultByID({required int id}) async{
  
      try {
        final remote = await remoteDataSourseRervationResult.getAllRersvationResultByID(id: id);
        return Right(remote);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
   
  }
}
