import 'package:bank_auction_hub/Functions/helper_functions.dart';
import 'package:bank_auction_hub/Models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthCubitCubit() : super(AuthCubitInitial()) {
    if (_auth.currentUser != null) {
      emit(AuthLoggedInState());
    } else {
      emit(AuthLoggedOutState());
    }
  }

  void goToRegister() {
    emit(AuthRegisterState());
  }

  void goToLogin() {
    emit(AuthLoginState());
  }

  Future<void> loginUser(String emailStr, String passwordStr) async {
    emit(AuthLoadingState());

    bool result = false;
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailStr, password: passwordStr);

      // final ref =
      //     await _firestore.collection("Users").doc(credential.user!.uid).get();
      // // final userData = ref.data();
      // final value = UserModel.fromSnap(ref);
      // String name = value!.fullname;
      // bool isBanker = value.isBanker;
      // int color = value.color;

      result = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState(errorMsg: "User Not Found"));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState(errorMsg: "Email or Password is not Correct..."));
      }
    } catch (e) {
      emit(AuthErrorState(errorMsg: e.toString()));
    }

    if (result) {
      emit(AuthLoggedInState());
    } else {
      emit(AuthErrorState(errorMsg: "Something went Wrong"));
    }
  }

  Future<void> registerUser(
    String nameStr,
    String emailStr,
    String phoneStr,
    String passwordStr,
    String bankNameStr,
    bool isBankerSelected,
  ) async {
    emit(AuthLoadingState());
    bool result = false;

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: emailStr,
        password: passwordStr,
      );
      final profileName = generateProfileText(nameStr);
      final profileColor = generateRandomColor();
      UserModel model = UserModel(
          id: credential.user!.uid,
          fullname: nameStr,
          email: emailStr,
          phone: phoneStr,
          profile: profileName,
          bankname: bankNameStr,
          color: profileColor,
          isBanker: isBankerSelected);

      await _firestore
          .collection("Users")
          .doc(credential.user!.uid)
          .set(model.toMap());
      result = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(AuthErrorState(
            errorMsg: "Email Already Exist... Try different email."));
      } else {
        emit(AuthErrorState(errorMsg: e.code.toString()));
      }
    } catch (e) {
      emit(AuthErrorState(errorMsg: e.toString()));
    }

    if (result) {
      emit(AuthLoggedInState());
    } else {
      emit(AuthErrorState(errorMsg: "Something went Wrong"));
    }
  }

  void singOut() {
    _auth.signOut();
    emit(AuthLoggedOutState());
  }

  void forgotPassword(String email) {
    emit(AuthLoadingState());
    //do stuff
    try {
      _auth.sendPasswordResetEmail(email: email).whenComplete(() {
        emit(AuthLoginState());
      }).onError((error, stackTrace) {
        emit(AuthErrorState(errorMsg: error.toString()));
      });
    } catch (e) {
      emit(AuthErrorState(errorMsg: e.toString()));
    }
  }
}
