import 'package:clinic_app/src/config/app_routes.dart';
import 'package:clinic_app/src/config/app_theme.dart';
import 'package:clinic_app/src/cores/observer.dart';
import 'package:clinic_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:clinic_app/src/features/clinics/presentation/cubit/clinics_cubit.dart';
import 'package:clinic_app/src/features/doctorsByClinics/presentation/cubit/doctorsbyclinics_cubit.dart';
import 'package:clinic_app/src/features/reservation/presentation/cubit/reservation_cubit.dart';
import 'package:clinic_app/src/features/reservation_result/presentation/cubit/reservation_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart' as di;

void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //vertical show only
   

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
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ligthTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
