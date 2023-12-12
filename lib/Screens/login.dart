import 'package:bank_auction_hub/Screens/Components/login_widget.dart';
import 'package:bank_auction_hub/Screens/Components/onboarding.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: Expanded(child: LoginWidget()),
        tablet: Expanded(child: LoginWidget()),
        desktop: Row(
          children: [
            Expanded(child: OnBoarding()),
            Expanded(child: LoginWidget())
          ],
        ),
      ),
    );
  }
}
