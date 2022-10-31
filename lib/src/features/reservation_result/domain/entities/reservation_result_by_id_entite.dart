import 'package:equatable/equatable.dart';

class ReservationResultByIdEntite extends Equatable {
  SickModel? sickModel;
  ReservationResultByIdEntite({required this.sickModel});
  
  @override
  List<Object?> get props => [sickModel];

}

class SickModel {
  late String status;
  late String note;
  late String drug;
  SickModel({required this.status, required this.note, required this.drug});

  factory SickModel.fromJson(Map<String, dynamic> json) {
    return SickModel(
        status: json['status'], note: json['note'], drug: json['drug']);
  }
}
