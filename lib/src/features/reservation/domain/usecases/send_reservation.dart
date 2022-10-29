import 'package:clinic_app/src/features/reservation/domain/repositories/reservation_repostories.dart';
import 'package:dartz/dartz.dart';

import '../../../../cores/errors/failure.dart';

class SendReservationUseCase {
  ReservationRepostories reservationRepostories;
  SendReservationUseCase({required this.reservationRepostories});
  
    Future<Either<Failure, Unit>> call({required int id}) async{
      return await reservationRepostories.sendReseration(id: id);
    }
}
