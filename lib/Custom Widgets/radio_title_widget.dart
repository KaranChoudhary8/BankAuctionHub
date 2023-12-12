import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:flutter/material.dart';

class MyRadioTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final onTap;
  const MyRadioTile(
      {super.key,
      required this.title,
      required this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: isSelected ? primaryColor : greyColor, width: 5)),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
