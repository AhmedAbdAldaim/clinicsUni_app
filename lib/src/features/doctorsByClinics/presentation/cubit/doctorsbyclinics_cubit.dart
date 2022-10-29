import 'package:bloc/bloc.dart';
import 'package:clinic_app/src/features/doctorsByClinics/domain/entities/doctor_entite.dart';
import 'package:clinic_app/src/features/doctorsByClinics/domain/usecases/get_all_doctors.dart';
import 'package:equatable/equatable.dart';

part 'doctorsbyclinics_state.dart';

class DoctorsbyclinicsCubit extends Cubit<DoctorsbyclinicsState> {
  GetAllDoctorsUseCase getAllDoctorsUseCase;

  DoctorsbyclinicsCubit({required this.getAllDoctorsUseCase})
      : super(DoctorsbyclinicsInitial());

  List<DoctorEntite>? listDoctors;
  List<DoctorEntite>? filterlistDoctors;
  getAllDocByClinics({required int id}) async {
    emit(DoctorsbyclinicsLoadingState());
    final res = await getAllDoctorsUseCase.call(id: id);
    res.fold((l) {
      emit(DoctorsbyclinicsErrorsState());
    }, (r) {
      listDoctors = r;
      filterlistDoctors = listDoctors;
      emit(DoctorsbyclinicsSuccesState());
    });
  }

  searchDoc({required String value}) {
    filterlistDoctors = listDoctors!.where((element) {
      return element.name.startsWith(value) || element.price.startsWith(value) || element.section.startsWith(value);
    }).toList();
    emit(DoctorsbyclinicsSuccesState());
  }
}
