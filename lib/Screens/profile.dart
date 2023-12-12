import 'package:bank_auction_hub/Screens/Components/header_widget.dart';
import 'package:bank_auction_hub/Screens/Components/profile_widget.dart';
import 'package:bank_auction_hub/Screens/Components/side_widget.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              title: const Text(
                "Bank Auction Hub",
                softWrap: true,
                style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
      drawer: Responsive.isDesktop(context)
          ? null
          : Container(
              width: sidePanelWidth,
              color: whiteColor,
              padding: const EdgeInsets.symmetric(
                  horizontal: contentPadding, vertical: screenPadding),
              child: SidePanWidget(selectedIndex: 1)),
      body: Responsive(
          mobile: Column(
            children: [
              // HeaderWidget(),
              const Divider(
                thickness: 0.5,
                color: greyColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: contentPadding, vertical: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [Expanded(child: ProfileWidget())],
                  ),
                ),
              )
            ],
          ),
          tablet: Column(
            children: [
              // HeaderWidget(),
              const Divider(
                thickness: 0.5,
                color: greyColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: contentPadding, vertical: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [Expanded(child: ProfileWidget())],
                  ),
                ),
              )
            ],
          ),
          desktop: Column(
            children: [
              const HeaderWidget(),
              const Divider(
                thickness: 0.5,
                color: greyColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: screenPadding, vertical: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //Side pannel
                      SizedBox(
                        width: sidePanelWidth,
                        child: SidePanWidget(
                          selectedIndex: 1,
                        ),
                      ),

                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: contentPadding),
                        child: VerticalDivider(
                          color: greyColor,
                          thickness: 0.5,
                        ),
                      ),

                      Expanded(child: ProfileWidget())
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
