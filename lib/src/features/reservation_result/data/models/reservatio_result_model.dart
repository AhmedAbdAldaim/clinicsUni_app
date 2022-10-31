import '../../domain/entities/reservation_result_entite.dart';

class ReservatioResultModel extends ReservatioResultEntite {
  ReservatioResultModel({
    required super.id,
    required super.doctorModel});
  
  factory ReservatioResultModel.fromJson(Map<String, dynamic> json) {
    return ReservatioResultModel(
        doctorModel: json['doctor'] != null
            ? DoctorModel.fromJson(json['doctor'])
            : null, id: json['id']);
  }
}
