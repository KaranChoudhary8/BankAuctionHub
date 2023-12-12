import 'package:bank_auction_hub/Custom%20Widgets/icon_text_widget.dart';
import 'package:bank_auction_hub/Custom%20Widgets/labeled_text_widget.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/bloc/list_to_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionDetailsWidget extends StatelessWidget {
  const AuctionDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListToDetailCubit, ListToDetailState>(
      builder: (context, state) {
        if (state.selectedIndex == -1 || state.selectedModel == null) {
          return Container();
        }
        return SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    state.selectedModel!.type,
                    style: const TextStyle(color: greyColor, fontSize: 16),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //title
                  Text(
                    state.selectedModel!.title,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  //description
                  Text(
                    state.selectedModel!.description,
                    softWrap: true,
                    style: const TextStyle(fontSize: 15),
                  ),

                  const SizedBox(
                    height: contentPadding,
                  ),

                  //Price
                  Text(
                    state.selectedModel!.basePrice,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  //bank
                  Text(state.selectedModel!.bankName,
                      style: const TextStyle(fontSize: 15)),

                  const SizedBox(
                    height: contentPadding,
                  ),

                  const Text(
                    "Property Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  IconTextWidget(
                      icon: profileIcon,
                      text: state.selectedModel!.borrowerName),

                  const SizedBox(
                    height: 5,
                  ),

                  IconTextWidget(
                      icon: areaIcon, text: state.selectedModel!.area),

                  const SizedBox(
                    height: 5,
                  ),

                  IconTextWidget(
                      icon: locationIcon, text: state.selectedModel!.location),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: contentPadding / 2),
                    child: Divider(
                      color: greyColor,
                      thickness: 0.5,
                    ),
                  ),

                  const Text(
                    "Auction Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  LabeledTextWidget(
                      label: "Auction Start Date and Time:",
                      text: state.selectedModel!.auctionStart),

                  LabeledTextWidget(
                      label: "Auction End Date and Time:",
                      text: state.selectedModel!.auctionEnd),

                  LabeledTextWidget(
                      label: "Bid Increment value:",
                      text: state.selectedModel!.bidIncrement),

                  LabeledTextWidget(
                      label: "Auto Extension time:",
                      text: state.selectedModel!.incrementTime),

                  LabeledTextWidget(
                      label: "No. of Auto Extension:",
                      text: state.selectedModel!.bidExtension),

                  LabeledTextWidget(
                      label: "EMD Amount:",
                      text: state.selectedModel!.amountEMD),
                  LabeledTextWidget(
                      label: "EMD Deposit Bank Account No:",
                      text: state.selectedModel!.bankNoEMD),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
