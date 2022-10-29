import 'package:bloc/bloc.dart';
import 'package:clinic_app/src/features/clinics/domain/entities/clinic_entite.dart';
import 'package:clinic_app/src/features/clinics/domain/usecases/get_all_clinic.dart';
import 'package:equatable/equatable.dart';

part 'clinics_state.dart';

class ClinicsCubit extends Cubit<ClinicsState> {
  GetAllClinicsUseCase clinicsUseCase;
  ClinicsCubit({required this.clinicsUseCase}) : super(ClinicsInitial());

  //getallClinic
  List<ClinicEntit>? listClinics;
  List<ClinicEntit>? filterListClinics;
  getAllClinics() async {
    emit(ClinicsLoadingState());
    final res = await clinicsUseCase.call();
    res.fold((l) {
      emit(ClinicsErrorState());
    }, (r) {
      listClinics = r;
      filterListClinics = listClinics;
      emit(ClinicsSuccessState());
    });
  }

  searchClinic({required String value}) {
    filterListClinics = listClinics!.where((element) {
      return element.name.startsWith(value);
    }).toList();
    emit(ClinicsSuccessState());
  }
}
