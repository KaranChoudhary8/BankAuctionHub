import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String phone;
  final String profile;
  final int color;
  final bool isBanker;
  final String? bankname;

  UserModel(
      {this.id,
      required this.fullname,
      required this.email,
      required this.phone,
      required this.profile,
      required this.color,
      required this.isBanker,
      this.bankname});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'profile': profile,
      'color': color,
      'isBanker': isBanker,
      'bankname': bankname
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final snapshot = documentSnapshot.data()!;
    return UserModel(
      fullname: snapshot['fullname'],
      id: snapshot['id'],
      email: snapshot['email'],
      phone: snapshot['phone'],
      profile: snapshot['profile'],
      color: snapshot['color'],
      isBanker: snapshot['isBanker'],
      bankname: snapshot['bankname'],
    );
  }

  static UserModel? fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      fullname: snapshot['fullname'],
      id: snapshot['id'],
      email: snapshot['email'],
      phone: snapshot['phone'],
      profile: snapshot['profile'],
      color: snapshot['color'],
      isBanker: snapshot['isBanker'],
      bankname: snapshot['bankname'],
    );
  }
}
