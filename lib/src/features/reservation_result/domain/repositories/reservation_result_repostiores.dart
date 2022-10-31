import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/reservation_result/domain/entities/reservation_result_by_id_entite.dart';
import 'package:clinic_app/src/features/reservation_result/domain/entities/reservation_result_entite.dart';
import 'package:dartz/dartz.dart';

abstract class ReservatioResultRepostiores {
  Future<Either<Failure, List<ReservatioResultEntite>>>
      getAllReservationResult();
  Future<Either<Failure, List<ReservationResultByIdEntite>>>
      getAllReservationResultByID({required int id});
}
