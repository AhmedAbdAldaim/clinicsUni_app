import 'package:equatable/equatable.dart';

class ReservatioResultEntite extends Equatable {
  late int id;
  DoctorModel? doctorModel;

  ReservatioResultEntite({
    required this.id,
    required this.doctorModel,
  });

  @override
  List<Object?> get props => [doctorModel];
}

class DoctorModel {
  late String name;
  late String section;
  late String price;
  DoctorModel({required this.name, required this.section, required this.price});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
        name: json['name'], section: json['section'], price: json['price']);
  }
}
