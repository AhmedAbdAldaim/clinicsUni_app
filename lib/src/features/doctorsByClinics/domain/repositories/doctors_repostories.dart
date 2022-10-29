import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/doctorsByClinics/domain/entities/doctor_entite.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorsRepostiores {
  Future<Either<Failure, List<DoctorEntite>>> getAllDoctors({required int id});
}
