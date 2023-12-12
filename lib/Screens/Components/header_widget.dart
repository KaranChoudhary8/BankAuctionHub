import 'package:bank_auction_hub/Custom%20Widgets/profile_photo.dart';
import 'package:bank_auction_hub/Functions/firebase_getter.dart';
import 'package:bank_auction_hub/Functions/helper_functions.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatelessWidget {
  final bool isSearchBarVisible;

  const HeaderWidget({
    super.key,
    this.isSearchBarVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal:
                Responsive.isDesktop(context) ? screenPadding : contentPadding,
            vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bank Auction Hub",
              softWrap: true,
              style: TextStyle(
                  fontSize: Responsive.isDesktop(context) ? 36 : 20,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),

            //serach bar
            if (isSearchBarVisible)
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Responsive.isDesktop(context) ? 350 : 100,
                    height: 46,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SvgPicture.asset(
                                searchIcon,
                                width: 20,
                                height: 20,
                                fit: BoxFit.scaleDown,
                                colorFilter: const ColorFilter.mode(
                                    primaryColor, BlendMode.srcIn),
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: greyColor),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        filterIcon,
                        width: Responsive.isDesktop(context) ? 30 : 20,
                        height: Responsive.isDesktop(context) ? 30 : 20,
                        fit: BoxFit.fitWidth,
                        colorFilter: const ColorFilter.mode(
                            primaryColor, BlendMode.srcIn),
                      ))
                ],
              ),

            //profile
            if (Responsive.isDesktop(context))
              StreamBuilder(
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, profileScreenRoute);
                        },
                        child: Row(
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
                                  style: const TextStyle(
                                      color: greyColor, fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  })
          ],
        ),
      ),
    );
  }
}
