import 'package:clinic_app/src/features/company/domain/entities/company_entite.dart';

class CompanyModel extends CompanyEntite {
  CompanyModel(
      {required super.id,
      required super.name,
      required super.phone,
      required super.address,
      required super.discount,
      required super.type});

  factory CompanyModel.fromJson(dynamic json) {
    return CompanyModel(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        address: json['address'],
        discount: json['discount'],
        type: json['type']);


  }
}
