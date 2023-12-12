import 'package:bank_auction_hub/Screens/Components/forgot_widget.dart';
import 'package:bank_auction_hub/Screens/Components/onboarding.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: Expanded(child: ForgotWidget()),
        tablet: Expanded(child: ForgotWidget()),
        desktop: Row(
          children: [
            Expanded(child: OnBoarding()),
            Expanded(child: ForgotWidget())
          ],
        ),
      ),
    );
  }
}
