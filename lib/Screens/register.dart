import 'package:bank_auction_hub/Screens/Components/onboarding.dart';
import 'package:bank_auction_hub/Screens/Components/register_widget.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: Expanded(child: RegisterWidget()),
        tablet: Expanded(child: RegisterWidget()),
        desktop: Row(
          children: [Expanded(child: OnBoarding()), Expanded(child: RegisterWidget())],
        ),
      ),
    );
  }
}
