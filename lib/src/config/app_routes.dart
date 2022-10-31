import 'package:clinic_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:clinic_app/src/features/auth/presentation/screens/register_screen.dart';
import 'package:clinic_app/src/features/auth/presentation/screens/splash_screen.dart';
import 'package:clinic_app/src/features/clinics/presentation/screens/clinics_screen.dart';
import 'package:clinic_app/src/features/company/presentation/screens/company_screen.dart';
import 'package:clinic_app/src/features/reservation_result/presentation/screens/reservation_result.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String companyScreen = '/companyScreen';
  static const String registerScreen = '/registerScreen';
  static const String clinicsScreen = '/clinicsScreen';
  static const String loginScreen = "/loginScreen";
  static const String doctorescreen = "/doctorescreen";
  static const String reservationResultScreen = "/reservationResultScreen";
  static const String reservationResultByIDScreen =
      "/reservationResultByIDScreen";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case companyScreen:
        return MaterialPageRoute(builder: (_) => const CompanyScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case clinicsScreen:
        return MaterialPageRoute(builder: (_) => ClinicsScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
     case reservationResultScreen:
        return MaterialPageRoute(builder: (_) =>  ReservationResultScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
