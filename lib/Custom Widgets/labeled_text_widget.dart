import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:flutter/material.dart';

class LabeledTextWidget extends StatelessWidget {
  final String label;
  final String text;
  const LabeledTextWidget({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            softWrap: true,
            style: const TextStyle(color: greyColor, fontSize: 15),
          ),
        ),
        Text(
          text == "0" ? "-" : text,
          style: const TextStyle(color: greyColor, fontSize: 15),
        ),
      ],
    );
  }
}
