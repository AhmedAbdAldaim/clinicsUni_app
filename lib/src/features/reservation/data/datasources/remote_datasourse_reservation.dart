import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:clinic_app/dependency_injection.dart' as di;
import '../../../auth/data/datasources/local/sharedprefrencese_helper.dart';

abstract class RemoteDataSourseReservation {
  Future<Unit> sendReservation({required int id});
}

class RemoteDtateSouresReservationImp extends RemoteDataSourseReservation {
  http.Client client;
  RemoteDtateSouresReservationImp({required this.client});

  @override
  Future<Unit> sendReservation({required int id}) async {
    var res = await client.post(
        Uri.parse("${AppString.baseUel}${AppString.reservation}"),
        body: {
          'doctor_id': id.toString()
        },
        headers: {
          'Authorization': di.sl<SharedPrefrencesHelper>().getData(key: 'token')
        });
    if (res.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerExceptions();
    }
  }
}
