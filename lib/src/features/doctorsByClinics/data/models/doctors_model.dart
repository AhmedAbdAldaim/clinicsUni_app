import 'dart:convert';

import 'package:clinic_app/src/features/doctorsByClinics/domain/entities/doctor_entite.dart';

class DoctorsModel extends DoctorEntite {
  DoctorsModel(
      {required super.id,
      required super.name,
      required super.section,
      required super.price});
  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
        id: json['id'],
        name: json['name'],
        section: json['section'],
        price: json['price']);
  }
}
