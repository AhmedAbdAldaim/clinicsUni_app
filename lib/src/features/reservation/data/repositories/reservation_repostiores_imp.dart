import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/cores/networkinfo.dart';
import 'package:clinic_app/src/features/reservation/data/datasources/remote_datasourse_reservation.dart';
import 'package:clinic_app/src/features/reservation/domain/repositories/reservation_repostories.dart';
import 'package:dartz/dartz.dart';

class ReservationRepostoriesImp extends ReservationRepostories {
  NetworkInfo networkInfo;
  RemoteDataSourseReservation remoteDataSourseReservation;
  ReservationRepostoriesImp(
      {required this.networkInfo, required this.remoteDataSourseReservation});
  @override
  Future<Either<Failure, Unit>> sendReseration({required int id}) async {
    if (await networkInfo.checkInternet()) {
      try {
        final remote = await remoteDataSourseReservation.sendReservation(id: id);
        return Right(remote);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
