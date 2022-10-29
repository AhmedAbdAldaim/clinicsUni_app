import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/clinics/domain/entities/clinic_entite.dart';
import 'package:clinic_app/src/features/clinics/domain/repositories/clinic_repostiores.dart';
import 'package:dartz/dartz.dart';

class GetAllClinicsUseCase {
  ClinicRepostiores clinicRepostiores;
  GetAllClinicsUseCase({required this.clinicRepostiores});

  Future<Either<Failure, List<ClinicEntit>>> call() async {
    return await clinicRepostiores.getAllClinics();
  }
}
