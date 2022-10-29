import 'dart:convert';

import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:clinic_app/src/features/company/data/models/company_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSoures {
  Future<List<CompanyModel>> getAllCompanyDataSourses();
}

class RemoteDataSouresImp extends RemoteDataSoures {
  final http.Client client;
  RemoteDataSouresImp({required this.client});

  @override
  Future<List<CompanyModel>> getAllCompanyDataSourses() async {
    final res =
        await client.get(Uri.parse("${AppString.baseUel}${AppString.company}"));
    if (res.statusCode == 200) {
      final Map<String, dynamic> resbody = jsonDecode(res.body);
      final resbodyToList = resbody['company'] as List;
      return resbodyToList.map((e) => CompanyModel.fromJson(e)).toList();
    } else {
      throw ServerExceptions();
    }
  }
}
