part of 'clinics_cubit.dart';

abstract class ClinicsState {}

class ClinicsInitial extends ClinicsState {}

class ClinicsLoadingState extends ClinicsState {}

class ClinicsSuccessState extends ClinicsState {}

class ClinicsErrorState extends ClinicsState {}
