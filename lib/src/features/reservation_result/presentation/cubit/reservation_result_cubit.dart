import 'package:bloc/bloc.dart';
import 'package:clinic_app/src/features/reservation_result/domain/entities/reservation_result_by_id_entite.dart';
import 'package:clinic_app/src/features/reservation_result/domain/entities/reservation_result_entite.dart';
import 'package:clinic_app/src/features/reservation_result/domain/usecases/get_all_reservation_result_byid_usecase.dart';
import 'package:clinic_app/src/features/reservation_result/domain/usecases/get_all_reservation_result_usecase.dart';
import 'package:equatable/equatable.dart';

part 'reservation_result_state.dart';

class ReservationResultCubit extends Cubit<ReservationResultState> {
  GetAllReservationResultUsecase getallreservationreslut;
  GetAllReservationResultByIDUsecase getallreservationreslutByID;
  ReservationResultCubit(
      {required this.getallreservationreslut,
      required this.getallreservationreslutByID})
      : super(ReservationResultInitial());

  //getallreservation result
  List<ReservatioResultEntite>? list;
  getAllReservationResultFun() async {
    emit(ReservationResultLoading());
    if(isClosed) emit(ReservationResultInitial()); 
    final res = await getallreservationreslut.call();
    res.fold((l) {
      emit(ReservationResultError());
    }, (r) {
      list = r;
      emit(ReservationResultSuccess());
    });
  }

  //get reserby id
  List<ReservationResultByIdEntite>? listbyid;
  getAllReservationResultByIDFun({required int id}) async {
     emit(ReservationResultInitial());
    emit(ReservationResultByIDLoading());
    if(isClosed) print('sjdjdjdjkkd'); 
    final res = await getallreservationreslutByID.call(id: id);
    res.fold((l) {
      emit(ReservationResultByIDError());
    }, (r) {
      listbyid = r;
      emit(ReservationResultByIDSuccess());
    });
  }
}
