import 'package:clinic_app/src/features/auth/domain/entities/register_entite.dart';

class RegisterModel extends RegisterEntite {
  RegisterModel({required super.status, required super.token, required super.user});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(status: json['status'], token: json['token'], user: UserEntite.fromJson(json['user']));
  }

}
