part of 'reservation_cubit.dart';

abstract class ReservationState {}

class ReservationInitial extends ReservationState {}
class ReservationLoadingState extends ReservationState {}
class ReservationSuccessState extends ReservationState {}
class ReservationErrorState extends ReservationState {}
