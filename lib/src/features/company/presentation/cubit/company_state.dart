part of 'company_cubit.dart';

abstract class CompanyState{}

class CompanyInitial extends CompanyState {}
class CompanyLoadingState  extends CompanyState{}
class CompanySuccessState  extends CompanyState{}
class CompanyErrorState  extends CompanyState{}
