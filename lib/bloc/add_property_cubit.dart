import 'package:bank_auction_hub/Models/auction_detail_model.dart';
import 'package:bank_auction_hub/Models/user_model.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddPropertyCubit extends Cubit<AddPropertyFormState> {
  AddPropertyCubit() : super(AddPropertyFormSubmitState());

  Future<void> submitPropertyForm(
    String type,
    String title,
    String location,
    String city,
    String area,
    String borrower,
    String description,
    String basePrice,
    String startTime,
    String endTime,
    String bidIncrement,
    String incrementTime,
    String bidExtension,
    String emdAmount,
    String emdBankNo,
  ) async {
    emit(PropertyLoadingState());
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? bankName;
    try {
      final ref =
          await firestore.collection("Users").doc(auth.currentUser!.uid).get();
      // final userData = ref.data();
      final value = UserModel.fromSnap(ref);

      bankName = value!.bankname;
    } catch (e) {
      emit(PropertyErrorState());
    }

    AuctionDetailModel model = AuctionDetailModel(
      type: type,
      title: title,
      location: "$location, $city",
      city: city,
      area: area,
      borrowerName: borrower,
      description: description,
      basePrice: basePrice,
      amountEMD: emdAmount,
      auctionEnd: endTime,
      auctionStart: startTime,
      bankName: bankName ?? "unknown",
      bankNoEMD: emdBankNo,
      bidExtension: bidExtension,
      bidIncrement: bidIncrement,
      incrementTime: incrementTime,
    );

    try {
      firestore
          .collection(propertyCollection)
          .add(model.toMap())
          .whenComplete(() {
        emit(AddPropertyFormSuccessState());
      });
    } catch (e) {
      emit(PropertyErrorState());
    }
  }
}

abstract class AddPropertyFormState {}

class AddPropertyFormSubmitState extends AddPropertyFormState {}

class AddPropertyFormSuccessState extends AddPropertyFormState {}

class PropertyLoadingState extends AddPropertyFormState {}

class PropertyErrorState extends AddPropertyFormState {}
