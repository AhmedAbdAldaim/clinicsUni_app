import 'dart:convert';

import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/features/auth/data/models/login_model.dart';
import 'package:clinic_app/src/features/auth/data/models/register_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSouresAuth {
  Future<RegisterModel> registerDataSourses(Map<String, dynamic> data);
  Future<LoginModel> loginDataSourses(Map<String, dynamic> data);
}

class RemoteDataSourseAuthImp extends RemoteDataSouresAuth {
  http.Client client;
  RemoteDataSourseAuthImp({required this.client});

  @override
  Future<RegisterModel> registerDataSourses(Map<String, dynamic> data) async {
    var res = await http.post(
        Uri.parse("${AppString.baseUel}${AppString.register}"),
        body: data);
    if (res.statusCode == 200) {
      final Map<String, dynamic> resbody = jsonDecode(res.body);
      RegisterModel registerModel = RegisterModel.fromJson(resbody);
      return registerModel;
    } else {
      throw ServerExceptions();
    }
  }

  @override
  Future<LoginModel> loginDataSourses(Map<String, dynamic> data) async {
    var res = await client
        .post(Uri.parse("${AppString.baseUel}${AppString.login}"), body: data);
    if (res.statusCode == 200) {
      Map<String, dynamic> resBody = jsonDecode(res.body);
      LoginModel loginModel = LoginModel.fromJson(resBody);
      return loginModel;
    } else {
      throw ServerExceptions();
    }
  }
}
