import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ReservationRepostories {
  Future<Either<Failure, Unit>> sendReseration({required int id});
}
