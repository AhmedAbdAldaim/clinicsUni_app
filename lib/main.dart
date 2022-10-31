import 'package:clinic_app/dependency_injection.dart';
import 'package:clinic_app/src/config/app_routes.dart';
import 'package:clinic_app/src/config/app_theme.dart';
import 'package:clinic_app/src/cores/observer.dart';
import 'package:clinic_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:clinic_app/src/features/clinics/presentation/cubit/clinics_cubit.dart';
import 'package:clinic_app/src/features/company/presentation/cubit/company_cubit.dart';
import 'package:clinic_app/src/features/doctorsByClinics/presentation/cubit/doctorsbyclinics_cubit.dart';
import 'package:clinic_app/src/features/reservation/presentation/cubit/reservation_cubit.dart';
import 'package:clinic_app/src/features/reservation_result/presentation/cubit/reservation_result_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart' as di;

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //vertical show only
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()),
        BlocProvider(create: (_) => di.sl<ClinicsCubit>()..getAllClinics()),
       BlocProvider(create: (_) => di.sl<DoctorsbyclinicsCubit>()),
       BlocProvider(create: (_)=> di.sl<ReservationCubit>()),
       BlocProvider.value(value: di.sl<ReservationResultCubit>()..getAllReservationResultFun()),
    //  BlocProvider(create: (_)=> di.sl<ReservationResultCubit>()..getAllReservationResultFun())
      ],
      child: MaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ligthTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
