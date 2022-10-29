import 'package:equatable/equatable.dart';

class ReservationEntite extends Equatable {
  late bool status;
  ReservationEntite({required this.status});
  @override
  List<Object?> get props =>[status];
}
