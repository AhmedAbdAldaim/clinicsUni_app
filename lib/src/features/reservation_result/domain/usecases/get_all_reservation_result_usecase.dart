import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/reservation_result/domain/entities/reservation_result_entite.dart';
import 'package:clinic_app/src/features/reservation_result/domain/repositories/reservation_result_repostiores.dart';
import 'package:dartz/dartz.dart';

class GetAllReservationResultUsecase {
  ReservatioResultRepostiores reservatioResultRepostiores;
  GetAllReservationResultUsecase({required this.reservatioResultRepostiores});

  Future<Either<Failure, List<ReservatioResultEntite>>> call() async {
    return await reservatioResultRepostiores.getAllReservationResult();
  }
}
