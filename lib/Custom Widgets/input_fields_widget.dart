import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final bool isExpanded;
  final Widget child;
  final String label;
  const InputFieldWidget(
      {super.key,
      required this.child,
      required this.label,
      this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: isExpanded
              ? double.maxFinite
              : Responsive.isDesktop(context)
                  ? 510
                  : 400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: greyColor),
          ),
          child
        ],
      ),
    );
  }
}
