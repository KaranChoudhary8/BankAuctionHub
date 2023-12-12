import 'package:bank_auction_hub/Screens/Components/auction_details_widget.dart';
import 'package:bank_auction_hub/Screens/Components/auction_list_widget.dart';
import 'package:bank_auction_hub/Screens/Components/header_widget.dart';
import 'package:bank_auction_hub/Screens/Components/side_widget.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:bank_auction_hub/bloc/list_to_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              child: SidePanWidget(selectedIndex: 0)),
      body: Responsive(
          mobile: const Column(
            children: [
              Divider(
                thickness: 0.5,
                color: greyColor,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: contentPadding),
                child: AuctionListWidget(),
              )),
            ],
          ),
          tablet: Column(
            children: [
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
                      // //Side pannel
                      // SizedBox(
                      //   width: sidePanelWidth,
                      //   child: SidePanWidget(
                      //     selectedIndex: 0,
                      //   ),
                      // ),

                      //List
                      const Expanded(flex: 2, child: AuctionListWidget()),
                      BlocBuilder<ListToDetailCubit, ListToDetailState>(
                        builder: (context, state) {
                          if (state.selectedIndex == -1 ||
                              state.selectedModel == null) {
                            return Container();
                          }
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: contentPadding),
                            child: VerticalDivider(
                              color: greyColor,
                              thickness: 0.5,
                            ),
                          );
                        },
                      ),
                      //Details
                      BlocBuilder<ListToDetailCubit, ListToDetailState>(
                        builder: (context, state) {
                          if (state.selectedIndex == -1 ||
                              state.selectedModel == null) {
                            return Container();
                          }
                          return const Expanded(
                              flex: 2, child: AuctionDetailsWidget());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          desktop: Column(
            children: [
              const HeaderWidget(
                isSearchBarVisible: false,
              ),
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
                          selectedIndex: 0,
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

                      //List
                      const Expanded(flex: 2, child: AuctionListWidget()),
                      BlocBuilder<ListToDetailCubit, ListToDetailState>(
                        builder: (context, state) {
                          if (state.selectedIndex == -1 ||
                              state.selectedModel == null) {
                            return Container();
                          }
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: contentPadding),
                            child: VerticalDivider(
                              color: greyColor,
                              thickness: 0.5,
                            ),
                          );
                        },
                      ),
                      //Details
                      BlocBuilder<ListToDetailCubit, ListToDetailState>(
                        builder: (context, state) {
                          if (state.selectedIndex == -1 ||
                              state.selectedModel == null) {
                            return Container();
                          }
                          return const Expanded(
                              flex: 2, child: AuctionDetailsWidget());
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );

    /*
    return const Scaffold(
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        HeaderWidget(),
        Divider(
          thickness: 0.5,
          color: greyColor,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenPadding, vertical: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SidePanWidget(),
              Expanded(child: AuctionDetailsWidget())
            ],
          ),
        )
      ]),
    );
  
  */
  }
}
