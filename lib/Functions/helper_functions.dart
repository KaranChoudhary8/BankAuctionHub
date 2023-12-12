import 'dart:math';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

String generateProfileText(String name) {
  List<String> list = name.split(' ');
  String result = "";
  for (var i in list) {
    result += i[0];
    if (result.length == 2) {
      break;
    }
  }
  return result.toUpperCase();
}

getUserProfileFromSharePref() async {
  SharedPreferences shrpref = await SharedPreferences.getInstance();
  final String? result = shrpref.getString('profileName');
  return result ?? '';
}

getFristnameFromSharePref() async {
  SharedPreferences shrpref = await SharedPreferences.getInstance();
  final String? result = shrpref.getString('fullname');
  return result;
}

String getUserFirstName(String name) {
  List<String> list = name.split(' ');
  return list[0];
}

int generateRandomColor() {
  return Random().nextInt(colorsList.length);
}
