import 'dart:convert';

import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/features/auth/data/datasources/local/sharedprefrencese_helper.dart';
import 'package:clinic_app/src/features/doctorsByClinics/data/models/doctors_model.dart';
import 'package:http/http.dart' as http;
import 'package:clinic_app/dependency_injection.dart' as di;

abstract class RemoteDataSourseDoctors {
  Future<List<DoctorsModel>> getAllDoctorseRemote({required int id});
}

class RemoteDataSousesDoctorsImp extends RemoteDataSourseDoctors {
  http.Client client;
  RemoteDataSousesDoctorsImp({required this.client});

  @override
  Future<List<DoctorsModel>> getAllDoctorseRemote({required int id}) async {
    var response = await client.get(
        Uri.parse(
            "${AppString.baseUel}${AppString.doctorByClinic}$id/doctors"),
        headers: {
          'Authorization': di.sl<SharedPrefrencesHelper>().getData(key: 'token')
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> resBody = jsonDecode(response.body);
      var listDoc = resBody['doctors'] as List;
      return listDoc.map((e) => DoctorsModel.fromJson(e)).toList();
    } else {
      throw ServerExceptions();
    }
  }
}
