import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:flutter/material.dart';

class MyProfilePic extends StatelessWidget {
  final String text;
  final Color color;
  final bool isHeader;
  const MyProfilePic(
      {super.key,
      required this.text,
      required this.isHeader,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHeader ? 40 : 100,
      height: isHeader ? 40 : 100,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: isHeader ? 14 : 36, color: whiteColor),
        ),
      ),
    );
  }
}
