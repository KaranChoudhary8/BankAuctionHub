import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconTextWidget extends StatelessWidget {
  final String icon;
  final String text;

  const IconTextWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            fit: BoxFit.fitWidth,
            colorFilter: const ColorFilter.mode(greyColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            text,
            softWrap: true,
            style: const TextStyle(color: greyColor, fontSize: 15),
          ),
        )
      ],
    );
  }
}
