import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/clinics/domain/entities/clinic_entite.dart';
import 'package:dartz/dartz.dart';

abstract class ClinicRepostiores {
  Future<Either<Failure, List<ClinicEntit>>> getAllClinics();
}
