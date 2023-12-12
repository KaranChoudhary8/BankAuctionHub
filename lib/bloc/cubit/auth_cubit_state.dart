part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

class AuthRegisterState extends AuthCubitState {}

class AuthLoggedInState extends AuthCubitState {}

class AuthLoggedOutState extends AuthCubitState {}

class AuthLoadingState extends AuthCubitState {}

class AuthLoginState extends AuthCubitState {}

class AuthErrorState extends AuthCubitState {
  final String errorMsg;

  AuthErrorState({required this.errorMsg});
}
