import 'dart:convert';

import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/features/auth/data/datasources/local/sharedprefrencese_helper.dart';
import 'package:clinic_app/dependency_injection.dart' as di;
import 'package:clinic_app/src/features/reservation_result/data/models/reservation_result_by_id_model.dart';
import 'package:http/http.dart' as http;

import '../models/reservatio_result_model.dart';

abstract class RemoteDataSourseRervationResult {
  Future<List<ReservatioResultModel>> getAllRersvationResult();
    Future<List<ReservationResultByIdModel>> getAllRersvationResultByID({required int id});
}

class RemoteDataSourseRervationResultImp
    extends RemoteDataSourseRervationResult {
  http.Client client;
  RemoteDataSourseRervationResultImp({required this.client});

  @override
  Future<List<ReservatioResultModel>> getAllRersvationResult() async {
    var response = await client.get(
        Uri.parse('${AppString.baseUel}${AppString.reservation}'),
        headers: {
          'Authorization': di.sl<SharedPrefrencesHelper>().getData(key: 'token')
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> resBody = jsonDecode(response.body);
      var list = resBody['reservation'] as List;
      return list.map((e) => ReservatioResultModel.fromJson(e)).toList();
    } else {
      throw ServerExceptions();
    }
  }
  
  @override
  Future<List<ReservationResultByIdModel>> getAllRersvationResultByID({required int id})async {
   var response = await client.get(
        Uri.parse('${AppString.baseUel}${AppString.reservation}/$id'),
        headers: {
          'Authorization': di.sl<SharedPrefrencesHelper>().getData(key: 'token')
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> resBody = jsonDecode(response.body);
      var list = resBody['reservation'] as List;
      return list.map((e) => ReservationResultByIdModel.fromJson(e)).toList();
    } else {
      throw ServerExceptions();
    }
  }
  
 
}
