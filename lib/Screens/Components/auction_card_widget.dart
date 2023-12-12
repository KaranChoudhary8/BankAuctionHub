import 'package:bank_auction_hub/Models/auction_detail_model.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuctionCardWidget extends StatelessWidget {
  final AuctionDetailModel model;
  final bool isActive;
  const AuctionCardWidget({
    super.key,
    required this.model,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: isActive ? primaryOffColor : whiteColor,
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(width: 1, color: isActive ? primaryColor : greyColor)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  model.type,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: greyColor, fontSize: 13),
                ),
              ),
              Text("${model.auctionStart} - ${model.auctionEnd}",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: greyColor, fontSize: 12)),
            ],
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          model.title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          softWrap: true,
                        ),
                      ),

                      //area
                      Row(
                        children: [
                          SvgPicture.asset(
                            areaIcon,
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            model.area,
                            style:
                                const TextStyle(fontSize: 12, color: greyColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 160),
                        child: Text(
                          model.city,
                          style: const TextStyle(
                              color: greyColor,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(model.bankName,
                            style: const TextStyle(
                                color: greyColor, fontSize: 12)),
                        Text(
                          model.basePrice,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
