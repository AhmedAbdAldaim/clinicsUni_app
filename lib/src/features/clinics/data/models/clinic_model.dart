import 'package:clinic_app/src/features/clinics/domain/entities/clinic_entite.dart';

// ignore: must_be_immutable
class ClinicModel extends ClinicEntit {
  ClinicModel({required super.id, required super.name, required super.address});

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
        id: json['id'], name: json['name'], address: json['address']);
  }
}
