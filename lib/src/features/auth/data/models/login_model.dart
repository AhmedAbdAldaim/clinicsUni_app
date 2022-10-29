import 'package:clinic_app/src/features/auth/domain/entities/login_entite.dart';

class LoginModel extends LoginEntite{
  LoginModel({required super.status, required super.token, required super.message ,required super.userEntite});

  factory LoginModel.fromJson(Map<String, dynamic>? json) {
    return LoginModel(status: json!['status'], token: json['token'], message: json['message'] ,userEntite:json['user']!=null? UserEntite.fromJson(json['user']): null);
  }

}