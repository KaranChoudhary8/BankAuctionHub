import 'package:bank_auction_hub/Functions/firebase_getter.dart';
import 'package:bank_auction_hub/Models/auction_detail_model.dart';
import 'package:bank_auction_hub/Screens/Components/auction_card_widget.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/bloc/list_to_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionListWidget extends StatelessWidget {
  const AuctionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ListToDetailCubit myListtoDetailCubit =
        BlocProvider.of<ListToDetailCubit>(context);
    Stream<List<AuctionDetailModel>> data = getAuctionDetails();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<ListToDetailCubit, ListToDetailState>(
          builder: (context, state) {
            return StreamBuilder(
                stream: data,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (!snapshot.hasData) {
                    myListtoDetailCubit.userClickedonListCard(
                        index: -1, model: null);
                    return const Text("No data to Show");
                  } else {
                    List<AuctionDetailModel> detailModel = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "${detailModel.length} properties are availabe",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: detailModel.length,
                          itemBuilder: (context, item) {
                            return GestureDetector(
                                onTap: () {
                                  myListtoDetailCubit.userClickedonListCard(
                                      index: item, model: detailModel[item]);
                                },
                                child: AuctionCardWidget(
                                    isActive: state.selectedIndex == item
                                        ? true
                                        : false,
                                    model: detailModel[item]));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: contentPadding,
                            );
                          },
                        ),
                      ],
                    );
                  }
                }));
          },
        ),
      ),
    );
  }
}
