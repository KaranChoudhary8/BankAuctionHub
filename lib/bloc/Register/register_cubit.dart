import 'package:bloc/bloc.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit()
      : super(RegisterFormState(
            isConfirmVisible: false,
            isPasswordVisible: false,
            isBanker: false));

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void toggleConfirmVisibility() {
    emit(state.copyWith(isConfirmVisible: !state.isConfirmVisible));
  }

  void selectedRadio(bool selected) {
    emit(state.copyWith(isBanker: selected));
  }
}

class RegisterFormState {
  final bool isPasswordVisible;
  final bool isConfirmVisible;
  final bool isBanker;

  RegisterFormState(
      {this.isConfirmVisible = false,
      this.isPasswordVisible = false,
      this.isBanker = false});

  RegisterFormState copyWith(
      {bool? isPasswordVisible, bool? isConfirmVisible, bool? isBanker}) {
    return RegisterFormState(
      isConfirmVisible: isConfirmVisible ?? this.isConfirmVisible,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isBanker: isBanker ?? this.isBanker,
    );
  }
}
