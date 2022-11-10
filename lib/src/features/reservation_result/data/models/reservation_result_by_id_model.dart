import 'package:clinic_app/src/features/reservation_result/domain/entities/reservation_result_by_id_entite.dart';

class ReservationResultByIdModel extends ReservationResultByIdEntite {
  ReservationResultByIdModel({required super.companyname, required super.price, required super.discount, required super.type, required super.sickModel});

  factory ReservationResultByIdModel.fromJson(Map<String, dynamic> json) {
    return ReservationResultByIdModel(
        sickModel:  json['sick'] != null ? SickModel.fromJson(json['sick']) : null,
        discount: json['discount'],
        price: json['price'],
        type: json['type'],
        companyname: json['company_name']);
  }
}
