import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/reservation_result/domain/entities/reservation_result_by_id_entite.dart';
import 'package:clinic_app/src/features/reservation_result/domain/repositories/reservation_result_repostiores.dart';
import 'package:dartz/dartz.dart';

class GetAllReservationResultByIDUsecase {
  ReservatioResultRepostiores reservatioResultRepostiores;
  GetAllReservationResultByIDUsecase({required this.reservatioResultRepostiores});

  Future<Either<Failure, List<ReservationResultByIdEntite>>> call({required int id}) async {
    return await reservatioResultRepostiores.getAllReservationResultByID(id: id);
  }
}
