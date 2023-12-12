import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bank Auction Hub",
              style: TextStyle(
                  fontSize: 64,
                  color: whiteColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Welcome to the auction platform where properties find new owners.",
              style: TextStyle(color: whiteColor),
            ),
            Text(
                "Discover exclusive property auctions right at your fingertips.",
                style: TextStyle(color: whiteColor)),
          ]),
    );
  }
}
