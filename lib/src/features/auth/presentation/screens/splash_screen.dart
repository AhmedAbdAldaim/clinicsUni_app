import 'dart:async';

import 'package:clinic_app/src/config/app_routes.dart';
import 'package:clinic_app/src/cores/app_assets.dart';
import 'package:clinic_app/src/cores/mediquery/app_mediquery.dart';
import 'package:clinic_app/src/features/auth/data/datasources/local/sharedprefrencese_helper.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/dependency_injection.dart' as di;

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  var shared = di.sl<SharedPrefrencesHelper>();
  @override
  Widget build(BuildContext context) {
    var h = AppMediaQuery.height(context: context);
    var w = AppMediaQuery.width(context: context);

    page() {
      if (shared.getData(key: 'companyID') != null &&
          shared.getData(key: 'token') != null) {
        return Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.clinicsScreen, (route) => false);
      } else if (shared.getData(key: 'companyID') != null &&
          shared.getData(key: 'token') == null) {
        return Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false);
      } else {
        return Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.companyScreen, (route) => false);
      }
    }

    Future.delayed(const Duration(seconds: 7)).then((value) {
      return page();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.applogo,
            height: h / 5,
            width: w * 0.5,
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            "فيزيتا",
            style: TextStyle(fontSize: h * 0.02),
          ),
          Image.asset(
            AppAssets.apploading,
            height: h * 0.1,
            width: w * 0.5,
          )
        ],
      )),
    );
  }
}
