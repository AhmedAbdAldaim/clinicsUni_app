import 'package:bloc/bloc.dart';
import 'package:clinic_app/src/features/reservation/domain/usecases/send_reservation.dart';
import 'package:equatable/equatable.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  SendReservationUseCase sendReservationUseCase;
  ReservationCubit({required this.sendReservationUseCase})
      : super(ReservationInitial());

  //get all
  sendReservation({required int id}) async {
    emit(ReservationLoadingState());
    final res = await sendReservationUseCase.call(id: id);
    res.fold((l) {
      emit(ReservationErrorState());
    }, (r) {
      emit(ReservationSuccessState());
    });
  }
}
