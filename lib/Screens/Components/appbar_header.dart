import 'package:bank_auction_hub/Custom%20Widgets/profile_photo.dart';
import 'package:bank_auction_hub/Functions/firebase_getter.dart';
import 'package:bank_auction_hub/Functions/helper_functions.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:flutter/material.dart';

myAppbar(var context) {
  return AppBar(
    leading: Text(
      "Bank Auction Hub",
      softWrap: true,
      style: TextStyle(
          fontSize: Responsive.isDesktop(context) ? 36 : 20,
          color: primaryColor,
          fontWeight: FontWeight.bold),
    ),
    actions: [
      if (Responsive.isDesktop(context))
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, profileScreenRoute);
          },
          child: StreamBuilder(
              stream: getCurrentUserModel(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (!snapshot.hasData) {
                  return const Text("Something not Right");
                } else {
                  var userModel = snapshot.data!;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: MyProfilePic(
                          text: userModel.profile,
                          isHeader: true,
                          color: colorsList[userModel.color],
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            getUserFirstName(userModel.fullname),
                            softWrap: true,
                            style:
                                const TextStyle(color: greyColor, fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  );
                }
              }),
        )
    ],
  );
}
