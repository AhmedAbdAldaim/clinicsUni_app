import 'package:bloc/bloc.dart';
import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/features/auth/domain/entities/login_entite.dart';
import 'package:clinic_app/src/features/auth/domain/entities/register_entite.dart';
import 'package:clinic_app/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:clinic_app/src/features/auth/domain/usecases/register_usercase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;
  AuthCubit({required this.registerUseCase, required this.loginUseCase})
      : super(AuthInitial());

  //register
  register({required Map<String, dynamic> data}) async {
    emit(AuthLoadingState());
    final res = await registerUseCase.call(data: data);
     if (isClosed) emit(AuthInitial());
    res.fold((l) {
      emit(AuthErrorState(message: AppString.getMeassgse(l)));
    }, (r) {
      emit(AuthSuccessState(registerEntite: r));
    });
  }

  //login
  login({required Map<String, dynamic> data}) async {
    emit(AuthLoginLoadingState());
    final res = await loginUseCase.call(data: data);
    if (isClosed) emit(AuthInitial());
    res.fold((l) {
      emit(AuthLoginErrorState(message: AppString.getMeassgse(l)));
    }, (r) {
      emit(AuthLoginSuccessState(loginEntite: r));
    });
  }

  // ObscurePassword
  bool ispassword = true;
  obscurePasswordFun() {
    ispassword = !ispassword;
    emit(ObscurePassword());
  }
}
