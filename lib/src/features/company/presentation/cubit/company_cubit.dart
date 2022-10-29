import 'package:bloc/bloc.dart';
import 'package:clinic_app/src/features/company/domain/entities/company_entite.dart';
import 'package:clinic_app/src/features/company/domain/usecases/company_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CompanyUsecase companyUsecase;
  CompanyCubit({required this.companyUsecase}) : super(CompanyInitial());
  static CompanyCubit get(context) => BlocProvider.of(context);

  //get All Company
  List<CompanyEntite>? listCompany;
  getAllCompany() async {
    emit(CompanyLoadingState());
    final res = await companyUsecase.call();
    res.fold((l) {
      emit(CompanyErrorState());
    }, (r) {
      listCompany = r;
      emit(CompanySuccessState());
    });
  }

  int values = 1;
  select(val) {
    values = val;
    emit(CompanySuccessState());
  }
}
