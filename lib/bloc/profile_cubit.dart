import 'package:bank_auction_hub/Models/user_model.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit() : super(ProfileCubitInitialState());

  void startEditing(bool edit) {
    if (edit) {
      emit(ProfileCubitEditingState());
    } else {
      emit(ProfileCubitInitialState());
    }
  }

  void updateInformation(UserModel userModel, String? fullname, String? phone) {
    emit(ProfileCubitEditingLoadingState());
    //do stuff
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore ref = FirebaseFirestore.instance;

    try {
      phone = phone ?? userModel.phone;
      fullname = fullname ?? userModel.fullname;
      ref
          .collection(userCollection)
          .doc(auth.currentUser!.uid)
          .update(UserModel(
                  bankname: userModel.bankname,
                  id: userModel.id,
                  fullname: fullname,
                  email: userModel.email,
                  phone: phone,
                  profile: userModel.profile,
                  color: userModel.color,
                  isBanker: userModel.isBanker)
              .toMap())
          .whenComplete(() {
        emit(ProfileCubitSuccessState(
            successMsg: "User informartion updated successfully..."));
      });
    } catch (e) {
      emit(ProfileCubitErrorState(errorMsg: e.toString()));
    }
  }

  void enableChangePassword() {
    emit(ProfileCubitNewPasswordState());
  }

  void disableChangePassword() {
    emit(ProfileCubitInitialState());
  }

  void updatePassword(String oldPassword, String newPassword) {
    emit(ProfileCubitPasswordLoadingState());
    //do stuff
    var auth = FirebaseAuth.instance.currentUser;
    String email = auth!.email ?? "";

    try {
      var credential =
          EmailAuthProvider.credential(email: email, password: oldPassword);
      // auth.
      auth.reauthenticateWithCredential(credential).then((value) {
        auth.updatePassword(newPassword).whenComplete(() {
          emit(ProfileCubitSuccessState(
              successMsg: "Password Changed Successfully"));
        });
      });
    } catch (e) {
      emit(ProfileCubitErrorState(errorMsg: e.toString()));
    }
  }
}

abstract class ProfileCubitState {}

class ProfileCubitInitialState extends ProfileCubitState {}

class ProfileCubitEditingState extends ProfileCubitState {}

class ProfileCubitNewPasswordState extends ProfileCubitState {}

class ProfileCubitEditingLoadingState extends ProfileCubitState {}

class ProfileCubitPasswordLoadingState extends ProfileCubitState {}

class ProfileCubitSuccessState extends ProfileCubitState {
  final String successMsg;
  ProfileCubitSuccessState({required this.successMsg});
}

class ProfileCubitErrorState extends ProfileCubitState {
  final String errorMsg;
  ProfileCubitErrorState({required this.errorMsg});
}
