// class CustomRoutes extends Route
import 'package:bank_auction_hub/Screens/add.dart';
import 'package:bank_auction_hub/Screens/forgot_screen.dart';
import 'package:bank_auction_hub/Screens/home.dart';
import 'package:bank_auction_hub/Screens/login.dart';
import 'package:bank_auction_hub/Screens/profile.dart';
import 'package:bank_auction_hub/Screens/register.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/bloc/Register/register_cubit.dart';
import 'package:bank_auction_hub/bloc/add_property_cubit.dart';
import 'package:bank_auction_hub/bloc/list_to_detail.dart';
import 'package:bank_auction_hub/bloc/login_form_cubit.dart';
import 'package:bank_auction_hub/bloc/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ListToDetailCubit(),
                  child: const HomeScreen(),
                ));

      case loginScreenRoute:
        // return MaterialPageRoute(builder: (_) => LoginScreen());
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginFormCubit(),
                  child: const LoginScreen(),
                ));

      case forgotPasswordScreenRoute:
        return MaterialPageRoute(builder: (_) => const ForgotScreen());

      case registerScreenRoute:
        // return MaterialPageRoute(builder: (_) => RegisterScreen());
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterCubit(),
                  child: const RegisterScreen(),
                ));

      case addPropertyScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddPropertyCubit(),
                  child: const AddPropertyScreen(),
                ));

      case profileScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ProfileCubit(),
                  child: const ProfileScreen(),
                ));

      case errorScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text("Kaise h aap log")),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
