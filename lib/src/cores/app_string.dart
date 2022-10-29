import 'package:clinic_app/src/cores/errors/failure.dart';

class AppString {
  //dataSourse
  static const String baseUel = "http://192.168.43.176:8000/api/v1/";
  static const String register = "register";
  static const String login = "login";
  static const String company = "company";
  static const String clinic = "clinic";
  static const String doctorByClinic = "clinic/";
  static const String reservation = "reservation";

  //Failure
  static const String errorServer = "هناك خطأ في الإتصال بالخادم";
  
  static String getMeassgse(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'هناك خطأ في الإتصال بالخادم';
      case EmptyCacheFailure:
        return 'لا توجد اي بيانات';
      case OfflineFailure:
        return 'هناك خطأ في الإتصال بالإنترنت';
      default:
        return 'هناك خطا حدث';
    }
  }
}
