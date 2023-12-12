import 'package:cloud_firestore/cloud_firestore.dart';

class AuctionDetailModel {
  final String? id;
  final String type;
  final String title;
  final String location;
  final String city;
  final String borrowerName;
  final String area;
  final String description;
  final String bankName;
  final String basePrice;
  final String auctionStart;
  final String auctionEnd;
  final String bidIncrement;
  final String incrementTime;
  final String bidExtension;
  final String amountEMD;
  final String bankNoEMD;

  AuctionDetailModel({
    this.id,
    required this.type,
    required this.title,
    required this.location,
    required this.city,
    required this.borrowerName,
    required this.area,
    required this.description,
    required this.bankName,
    required this.basePrice,
    required this.auctionStart,
    required this.auctionEnd,
    required this.bidIncrement,
    required this.incrementTime,
    required this.bidExtension,
    required this.amountEMD,
    required this.bankNoEMD,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'title': title,
      'location': location,
      'city': city,
      'borrowerName': borrowerName,
      'area': area,
      'description': description,
      'bankName': bankName,
      'basePrice': basePrice,
      'auctionStart': auctionStart,
      'auctionEnd': auctionEnd,
      'bidIncrement': bidIncrement,
      'incrementTime': incrementTime,
      'bidExtension': bidExtension,
      'amountEMD': amountEMD,
      'bankNoEMD': bankNoEMD
    };
  }

  factory AuctionDetailModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final snapshot = documentSnapshot.data()!;
    return AuctionDetailModel(
        type: snapshot['type'],
        title: snapshot['title'],
        location: snapshot['location'],
        city: snapshot['city'],
        borrowerName: snapshot['borrowerName'],
        area: snapshot['area'],
        description: snapshot['description'],
        bankName: snapshot['bankName'],
        basePrice: snapshot['basePrice'],
        auctionStart: snapshot['auctionStart'],
        auctionEnd: snapshot['auctionEnd'],
        bidIncrement: snapshot['bidIncrement'],
        incrementTime: snapshot['incrementTime'],
        bidExtension: snapshot['bidExtension'],
        amountEMD: snapshot['amountEMD'],
        bankNoEMD: snapshot['bankNoEMD']);
  }

  // AuctionDetailModel.fromDocumentSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> doc) {}
  // // AuctionDetailModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
}
