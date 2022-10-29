import 'dart:convert';

import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/features/auth/data/datasources/local/sharedprefrencese_helper.dart';
import 'package:clinic_app/src/features/clinics/data/models/clinic_model.dart';
import 'package:http/http.dart' as http;
import 'package:clinic_app/dependency_injection.dart' as di;

abstract class RemoteDataSourseClinic {
  Future<List<ClinicModel>> getAllClinicsDataSourse();
}

class RemoteDataSourseClincsImp extends RemoteDataSourseClinic {
  http.Client client;
  RemoteDataSourseClincsImp({required this.client});

  @override
  Future<List<ClinicModel>> getAllClinicsDataSourse() async {
    var response =
        await client.get(Uri.parse("${AppString.baseUel}${AppString.clinic}"),  headers: {
      'Authorization': di.sl<SharedPrefrencesHelper>().getData(key: 'token')
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      var list = responseBody['clinic'] as List;
      return list.map((e) => ClinicModel.fromJson(e)).toList();
    } else {
      throw ServerExceptions();
    }
  }
}
