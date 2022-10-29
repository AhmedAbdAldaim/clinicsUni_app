part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  RegisterEntite registerEntite;
  AuthSuccessState({required this.registerEntite});
}

class AuthErrorState extends AuthState {
  String message;
  AuthErrorState({required this.message});
}


class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {
  LoginEntite loginEntite;
  AuthLoginSuccessState({required this.loginEntite});
}

class AuthLoginErrorState extends AuthState {
  String message;
  AuthLoginErrorState({required this.message});
}

class ObscurePassword extends AuthState{}
