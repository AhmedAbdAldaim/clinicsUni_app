import 'package:clinic_app/src/cores/errors/failure.dart';
import 'package:clinic_app/src/features/doctorsByClinics/domain/entities/doctor_entite.dart';
import 'package:clinic_app/src/features/doctorsByClinics/domain/repositories/doctors_repostories.dart';
import 'package:dartz/dartz.dart';

class GetAllDoctorsUseCase {
  DoctorsRepostiores doctorsRepostiores;
  GetAllDoctorsUseCase({required this.doctorsRepostiores});
  Future<Either<Failure, List<DoctorEntite>>> call({required int id}) async {
    return await doctorsRepostiores.getAllDoctors(id: id);
  }
}
