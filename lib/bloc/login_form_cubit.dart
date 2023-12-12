import 'package:bloc/bloc.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit() : super(LoginFormState(isPasswordVisible: false));

  void toggleLoginPasswordVisiblity() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}

class LoginFormState {
  final bool isPasswordVisible;
  LoginFormState({required this.isPasswordVisible});

  LoginFormState copyWith({bool? isPasswordVisible}) {
    return LoginFormState(
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible);
  }
}
