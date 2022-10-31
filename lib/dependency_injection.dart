import 'package:clinic_app/src/cores/networkinfo.dart';
import 'package:clinic_app/src/features/auth/data/datasources/local/sharedprefrencese_helper.dart';
import 'package:clinic_app/src/features/auth/data/datasources/remote/remote_datasourse_auth.dart';
import 'package:clinic_app/src/features/auth/data/repositories/auth_repostiores_imp.dart';
import 'package:clinic_app/src/features/auth/domain/repositories/auth_repostiores.dart';
import 'package:clinic_app/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:clinic_app/src/features/auth/domain/usecases/register_usercase.dart';
import 'package:clinic_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:clinic_app/src/features/clinics/data/datasources/remote_datasourse_clinic.dart';
import 'package:clinic_app/src/features/clinics/data/repositories/clinic_repostores_imp.dart';
import 'package:clinic_app/src/features/clinics/domain/repositories/clinic_repostiores.dart';
import 'package:clinic_app/src/features/clinics/domain/usecases/get_all_clinic.dart';
import 'package:clinic_app/src/features/clinics/presentation/cubit/clinics_cubit.dart';
import 'package:clinic_app/src/features/company/data/datasources/remote/remote_datasours.dart';
import 'package:clinic_app/src/features/company/data/repositories/company_repostories_imp.dart';
import 'package:clinic_app/src/features/company/domain/repositories/company_repostiore.dart';
import 'package:clinic_app/src/features/company/domain/usecases/company_usecase.dart';
import 'package:clinic_app/src/features/company/presentation/cubit/company_cubit.dart';
import 'package:clinic_app/src/features/doctorsByClinics/data/datasources/remote_datasourse_doctors.dart';
import 'package:clinic_app/src/features/doctorsByClinics/data/repositories/doctors_repostiores_imp.dart';
import 'package:clinic_app/src/features/doctorsByClinics/domain/repositories/doctors_repostories.dart';
import 'package:clinic_app/src/features/doctorsByClinics/domain/usecases/get_all_doctors.dart';
import 'package:clinic_app/src/features/doctorsByClinics/presentation/cubit/doctorsbyclinics_cubit.dart';
import 'package:clinic_app/src/features/reservation/data/datasources/remote_datasourse_reservation.dart';
import 'package:clinic_app/src/features/reservation/data/repositories/reservation_repostiores_imp.dart';
import 'package:clinic_app/src/features/reservation/domain/repositories/reservation_repostories.dart';
import 'package:clinic_app/src/features/reservation/domain/usecases/send_reservation.dart';
import 'package:clinic_app/src/features/reservation/presentation/cubit/reservation_cubit.dart';
import 'package:clinic_app/src/features/reservation_result/data/datasources/remote_datat_sourser_reservation_result.dart';
import 'package:clinic_app/src/features/reservation_result/data/repositories/reservation_result_repostories_imp.dart';
import 'package:clinic_app/src/features/reservation_result/domain/repositories/reservation_result_repostiores.dart';
import 'package:clinic_app/src/features/reservation_result/domain/usecases/get_all_reservation_result_byid_usecase.dart';
import 'package:clinic_app/src/features/reservation_result/domain/usecases/get_all_reservation_result_usecase.dart';
import 'package:clinic_app/src/features/reservation_result/presentation/cubit/reservation_result_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Company
  //-1 Cubit
  sl.registerLazySingleton(() => CompanyCubit(companyUsecase: sl()));
  sl.registerLazySingleton(
      () => AuthCubit(registerUseCase: sl(), loginUseCase: sl()));
  sl.registerLazySingleton(() => ClinicsCubit(clinicsUseCase: sl()));
  sl.registerLazySingleton(
      () => DoctorsbyclinicsCubit(getAllDoctorsUseCase: sl()));
  sl.registerLazySingleton(
      () => ReservationCubit(sendReservationUseCase: sl()));
  sl.registerLazySingleton(
      () => ReservationResultCubit(getallreservationreslut: sl(), getallreservationreslutByID: sl()));

  //2-Usescase
  sl.registerLazySingleton(() => CompanyUsecase(companyRepostiores: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepostoires: sl()));
  sl.registerLazySingleton(() => LoginUseCase(authRepostoires: sl()));
  sl.registerLazySingleton(() => GetAllClinicsUseCase(clinicRepostiores: sl()));
  sl.registerLazySingleton(
      () => GetAllDoctorsUseCase(doctorsRepostiores: sl()));
  sl.registerLazySingleton(
      () => SendReservationUseCase(reservationRepostories: sl()));
  sl.registerLazySingleton(
      () => GetAllReservationResultUsecase(reservatioResultRepostiores: sl()));
  sl.registerLazySingleton(
      () => GetAllReservationResultByIDUsecase(reservatioResultRepostiores: sl()));
  //3-Repo
  sl.registerLazySingleton<CompanyRepostiores>(
      () => CompanyRepostioresImp(networkInfo: sl(), remoteDataSoures: sl()));
  sl.registerLazySingleton<AuthRepostiores>(
      () => AuthRepostioriesImp(networkInfo: sl(), remoteDataSoures: sl()));
  sl.registerLazySingleton<ClinicRepostiores>(() =>
      ClinicRepostioresImp(networkInfo: sl(), remoteDataSourseClinic: sl()));
  sl.registerLazySingleton<DoctorsRepostiores>(() =>
      DoctorsRepostoriesImp(networkInfo: sl(), remoteDataSourseDoctors: sl()));
  sl.registerLazySingleton<ReservationRepostories>(() =>
      ReservationRepostoriesImp(
          networkInfo: sl(), remoteDataSourseReservation: sl()));
  sl.registerLazySingleton<ReservatioResultRepostiores>(() => ReservationResultImp(
      networInfo: sl(), remoteDataSourseRervationResult: sl()));

  //4-remotdatasourse

  sl.registerLazySingleton(
      () => SharedPrefrencesHelper(sharedprefrences: sl()));
  sl.registerLazySingleton<RemoteDataSoures>(
      () => RemoteDataSouresImp(client: sl()));
  sl.registerLazySingleton<RemoteDataSouresAuth>(
      () => RemoteDataSourseAuthImp(client: sl()));
  sl.registerLazySingleton<RemoteDataSourseClinic>(
      () => RemoteDataSourseClincsImp(client: sl()));
  sl.registerLazySingleton<RemoteDataSourseDoctors>(
      () => RemoteDataSousesDoctorsImp(client: sl()));
  sl.registerLazySingleton<RemoteDataSourseReservation>(
      () => RemoteDtateSouresReservationImp(client: sl()));
  sl.registerLazySingleton<RemoteDataSourseRervationResult>(
      () => RemoteDataSourseRervationResultImp(client: sl()));

  //5-network
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(internetConnectionChecker: sl()));

  //service
  final shared = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => shared);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
