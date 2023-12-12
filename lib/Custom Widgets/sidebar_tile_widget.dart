import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideBarTiles extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String icon;
  const SideBarTiles(
      {super.key,
      required this.title,
      required this.icon,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: isSelected ? primaryColor : whiteColor,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          //icon
          FittedBox(
            fit: BoxFit.scaleDown,
            child: SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              fit: BoxFit.fitWidth,
              colorFilter: isSelected
                  ? const ColorFilter.mode(whiteColor, BlendMode.srcIn)
                  : const ColorFilter.mode(greyColor, BlendMode.srcIn),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          //Text
          Text(
            title,
            style: TextStyle(
                color: isSelected ? whiteColor : greyColor, fontSize: 14),
          )
        ],
      ),
    );
  }
}
