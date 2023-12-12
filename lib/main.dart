import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/Settings/my_routes.dart';
import 'package:bank_auction_hub/bloc/cubit/auth_cubit_cubit.dart';
import 'package:bank_auction_hub/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitCubit(),
      child: BlocBuilder<AuthCubitCubit, AuthCubitState>(
        buildWhen: (previous, current) {
          return previous is AuthCubitInitial;
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              textTheme: GoogleFonts.quicksandTextTheme(
                Theme.of(context).textTheme,
              ),
              useMaterial3: true,
            ),
            onGenerateRoute: MyRoute.generateRoute,
            initialRoute: FirebaseAuth.instance.currentUser != null
                ? homeScreenRoute
                : loginScreenRoute,
            // initialRoute: state is AuthLoginState
            //     ? homeScreenRoute
            //     : state is AuthLoggedOutState
            //         ? loginScreenRoute
            //         : homeScreenRoute,
          );
        },
      ),
    );
  }
}
