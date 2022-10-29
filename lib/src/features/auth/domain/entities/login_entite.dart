import 'package:clinic_app/src/features/auth/domain/entities/register_entite.dart';
import 'package:equatable/equatable.dart';

class LoginEntite extends Equatable {
  late bool status;
  late String message;
  late String? token;
  UserEntite? userEntite;
  
  LoginEntite(
      {required this.status,required this.token,required this.message ,required this.userEntite});

  @override
  List<Object?> get props => [status, token, message,userEntite];
}

class UserEntite {
  late String name;
  late String email;
  late String password;
  late dynamic companyID;

  UserEntite({
    required this.email,
    required this.password,
  });

  UserEntite.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    companyID = json['company_id'];
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
