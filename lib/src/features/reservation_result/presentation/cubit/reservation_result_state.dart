part of 'reservation_result_cubit.dart';

abstract class ReservationResultState {}

class ReservationResultInitial extends ReservationResultState {}
class ReservationResultLoading extends ReservationResultState {}
class ReservationResultSuccess extends ReservationResultState {}
class ReservationResultError extends ReservationResultState {}

class ReservationResultByIDLoading extends ReservationResultState {}
class ReservationResultByIDSuccess extends ReservationResultState {}
class ReservationResultByIDError extends ReservationResultState {}