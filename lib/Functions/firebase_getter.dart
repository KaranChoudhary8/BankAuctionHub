import 'dart:async';

import 'package:bank_auction_hub/Models/auction_detail_model.dart';
import 'package:bank_auction_hub/Models/user_model.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Stream<List<AuctionDetailModel>> getAuctionDetails() async* {
//   List<AuctionDetailModel> list = [
//     AuctionDetailModel(
//         type: "Residential",
//         title: "Open Plot in S,No.342",
//         location:
//             "Ward No. 13, Rohi Kasba Bhal Road, Near Mohta College of Rajgarh",
//         city: "Jaipur",
//         bankName: "SBI",
//         borrowerName: "M/s Deem Construction Company",
//         area: "266.66 Sq.yards.",
//         description:
//             "All that the piece and parcel of Open Plot in S,No.342, 12th Ward, Opp. Smash Badminton Academy, Marsh Nagar. Anantapur Municipality & District-515001",
//         basePrice: "2599200.00",
//         auctionStart: "06 Nov 2023 11:00",
//         auctionEnd: "06 Nov 2023 15:00",
//         bidIncrement: "50000.00",
//         incrementTime: "10 (In Minutes)",
//         bidExtension: "Unlimited",
//         amountEMD: "760000.00",
//         bankNoEMD: "50200074019804"),
//     AuctionDetailModel(
//         type: "Residential",
//         title: "Open Plot in S,No.342",
//         location:
//             "Ward No. 13, Rohi Kasba Bhal Road, Near Mohta College of Rajgarh",
//         city: "Jaipur",
//         bankName: "SBI",
//         borrowerName: "M/s Deem Construction Company",
//         area: "266.66 Sq.yards.",
//         description:
//             "All that the piece and parcel of Open Plot in S,No.342, 12th Ward, Opp. Smash Badminton Academy, Marsh Nagar. Anantapur Municipality & District-515001",
//         basePrice: "2599200.00",
//         auctionStart: "06 Nov 2023 11:00",
//         auctionEnd: "06 Nov 2023 15:00",
//         bidIncrement: "50000.00",
//         incrementTime: "10 (In Minutes)",
//         bidExtension: "Unlimited",
//         amountEMD: "760000.00",
//         bankNoEMD: "50200074019804"),
//     AuctionDetailModel(
//         type: "Agriculture",
//         title: "WWe",
//         location: "Inodre, Rohi Kasba Bhal Road, Near Mohta College of Rajgarh",
//         city: "Indore",
//         borrowerName: "John",
//         area: "266.66 Sq.Ft.",
//         description: "",
//         bankName: "Unknown",
//         basePrice: "5050000.00",
//         auctionStart: "08 Nov 2023 11:00",
//         auctionEnd: "08 Nov 2023 15:00",
//         bidIncrement: "550000.00",
//         incrementTime: "10 (In Minutes)",
//         bidExtension: "Unlimited",
//         amountEMD: "505000.00",
//         bankNoEMD: "50200074019804"),
//     AuctionDetailModel(
//         type: "Residential",
//         title:
//             "All that the piece and parcel of Open Plot in S,No All that the piece and parcel of Open Plot in S,No All that the piece and parcel of Open Plot in S,No.342, 12th Ward, Opp. Smash Badminton Academy, Marsh Nagar. Anantapur Municipality & District-515001",
//         location:
//             "Ward No. 13, Rohi Kasba Bhal Road, Near Mohta College of Rajgarh",
//         city: "Jaipur",
//         borrowerName: "M/s Deem Construction Company",
//         area: "266.66 Sq.yards.",
//         bankName: "ICICI",
//         description:
//             "All that the piece and parcel of Open Plot in S,No.342, 12th Ward, Opp. Smash Badminton Academy, Marsh Nagar. Anantapur Municipality & District-515001",
//         basePrice: "2599200.00",
//         auctionStart: "06 Nov 2023 11:00",
//         auctionEnd: "06 Nov 2023 15:00",
//         bidIncrement: "50000.00",
//         incrementTime: "10 (In Minutes)",
//         bidExtension: "Unlimited",
//         amountEMD: "760000.00",
//         bankNoEMD: "50200074019804"),
//     AuctionDetailModel(
//         type: "Other",
//         title: "Unknown",
//         location: "1, AB Road, Near Gandhi College",
//         city: "Mumbai",
//         borrowerName: "Will Jacks",
//         area: "56.50 Sq.meter.",
//         description:
//             " in S,No.342, 12th Ward, Opp. Smash Badminton Academy, Marsh Nagar. Anantapur Municipality & District-515001",
//         bankName: "Kotak Mahintra Bank",
//         basePrice: "1324560.00",
//         auctionStart: "06 Nov 2023 15:00",
//         auctionEnd: "07 Nov 2023 15:00",
//         bidIncrement: "50000.00",
//         incrementTime: "10 (In Minutes)",
//         bidExtension: "Unlimited",
//         amountEMD: "760000.00",
//         bankNoEMD: "50200074019804"),
//   ];

//   yield list;
// }

Stream<List<AuctionDetailModel>> getAuctionDetails() async* {
  final firestore = FirebaseFirestore.instance;

  final QuerySnapshot<Map<String, dynamic>> dataRaw =
      await firestore.collection(propertyCollection).get();
  List<AuctionDetailModel> list =
      dataRaw.docs.map((e) => AuctionDetailModel.fromSnapshot(e)).toList();

  yield list;
}

Stream<UserModel> getCurrentUserModel() async* {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  final DocumentSnapshot<Map<String, dynamic>> dataRaw = await firestore
      .collection(userCollection)
      .doc(auth.currentUser?.uid)
      .get();

  yield UserModel.fromSnapshot(dataRaw);
}


