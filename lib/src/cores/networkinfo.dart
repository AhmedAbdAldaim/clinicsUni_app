import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> checkInternet();
}


class NetworkInfoImp extends NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkInfoImp({required this.internetConnectionChecker});
  
  @override
  Future<bool> checkInternet() {
    return internetConnectionChecker.hasConnection;
  }
}
