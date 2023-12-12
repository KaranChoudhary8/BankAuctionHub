import 'package:bank_auction_hub/Custom%20Widgets/sidebar_tile_widget.dart';
import 'package:bank_auction_hub/Functions/firebase_getter.dart';
import 'package:bank_auction_hub/Models/user_model.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/bloc/cubit/auth_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SidePanWidget extends StatelessWidget {
  final List sideBarItems = [
    {"icon": homeIcon, "title": "Dashboard", "navigate": homeScreenRoute},
    {"icon": profileIcon, "title": "Profile", "navigate": profileScreenRoute},
    {
      "icon": addIcon,
      "title": "Add Property",
      "navigate": addPropertyScreenRoute
    },
    // {"icon": adminIcon, "title": "Admin"},
    // {"icon": usersIcon, "title": "Users"},
    {"icon": logoutIcon, "title": "Logout"},
  ];
  final int selectedIndex;
  SidePanWidget({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: getCurrentUserModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (!snapshot.hasData) {
              return const Text("Something not Right");
            } else {
              UserModel userModel = snapshot.data!;

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: sideBarItems.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    if (!userModel.isBanker &&
                        sideBarItems[index]['title'] == 'Add Property') {
                      return const SizedBox(
                        width: double.infinity,
                        height: 1,
                      );
                    } else {
                      if (sideBarItems[index]['title'] == 'Logout') {
                        return Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Divider(
                                thickness: 0.5,
                                color: greyColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      actionsAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      title: const Text("Logout"),
                                      content: const Text(
                                          "Are you Sure you went to Logout..."),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: null,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6))),
                                          child: const Text("No"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            AuthCubitCubit authCubitCubit =
                                                BlocProvider.of<AuthCubitCubit>(
                                                    context);
                                            authCubitCubit.singOut();
                                            Navigator.popUntil(context,
                                                (route) => route.isFirst);
                                            Navigator.pushReplacementNamed(
                                                context, loginScreenRoute);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryColor,
                                              foregroundColor: whiteColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6))),
                                          child: const Text("Logout"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SideBarTiles(
                                  isSelected: false,
                                  title: sideBarItems[index]["title"],
                                  icon: sideBarItems[index]["icon"]),
                            )
                          ],
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          if (index != selectedIndex) {
                            Navigator.pushNamed(
                                context, sideBarItems[index]["navigate"]);
                          }
                        },
                        child: SideBarTiles(
                          icon: sideBarItems[index]["icon"],
                          title: sideBarItems[index]["title"],
                          isSelected: selectedIndex == index,
                        ),
                      );
                    }
                  });
            }
          }),
    );
  }
}




// Container(
          //   margin: const EdgeInsets.symmetric(vertical: 8),
          //   height: 0.5,
          //   color: greyColor,
          // ),