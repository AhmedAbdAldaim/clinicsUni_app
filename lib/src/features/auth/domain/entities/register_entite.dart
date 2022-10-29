import 'package:equatable/equatable.dart';

class RegisterEntite extends Equatable {
  late bool status;
  late String token;
  UserEntite? user;
  RegisterEntite({required this.status, required this.token, required this.user});

  @override
  List<Object?> get props => [status, token, user];
}

class UserEntite {
  late String name;
  late String email;
  late String password;
  late dynamic companyID;

  UserEntite(
      {required this.name,
      required this.email,
      required this.password,
      required this.companyID});

  UserEntite.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    companyID = json['company_id'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'company_id': companyID
    };
  }
}
