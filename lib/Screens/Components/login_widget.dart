import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/bloc/cubit/auth_cubit_cubit.dart';
import 'package:bank_auction_hub/bloc/login_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //key
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

    //controller
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final loginFormCubit = BlocProvider.of<LoginFormCubit>(context);
    final authCubit = BlocProvider.of<AuthCubitCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenPadding),
      child: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's Login!",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const Text("Welcome, fill information to get logged in..."),
            const SizedBox(
              height: 50,
            ),

            //Email
            TextFormField(
              validator: (value) {
                value = value?.trim();
                if (value == null || value.isEmpty) {
                  return "Enter email address";
                }
                return null;
              },
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(
                      emailIcon,
                      width: 20,
                      height: 20,
                      fit: BoxFit.scaleDown,
                      colorFilter:
                          const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                    )),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: greyColor),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Password
            BlocBuilder<LoginFormCubit, LoginFormState>(
              builder: (context, state) {
                return TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter password";
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: !state.isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          state.isPasswordVisible ? eyeClosedIcon : eyeIcon,
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                              greyColor, BlendMode.srcIn),
                        ),
                      ),
                      onPressed: () {
                        loginFormCubit.toggleLoginPasswordVisiblity();
                      },
                    ),
                    prefixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        lockIcon,
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                            primaryColor, BlendMode.srcIn),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: greyColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),

            //forgot Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, forgotPasswordScreenRoute);
                },
                style: TextButton.styleFrom(
                  foregroundColor: primaryColor,
                  alignment: Alignment.centerRight,
                ),
                child: const Text("Forgot Password?"),
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            //Submit
            BlocConsumer<AuthCubitCubit, AuthCubitState>(
              listener: (context, state) {
                if (state is AuthLoggedInState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Sucess")));
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacementNamed(context, homeScreenRoute);
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      String emailStr = emailController.text.toString().trim();
                      String passwordStr = passwordController.text.toString();

                      authCubit.loginUser(emailStr, passwordStr);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(64),
                      foregroundColor: whiteColor,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),

            Align(
              alignment: Alignment.center,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text("I do not have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, registerScreenRoute);
                      authCubit.goToRegister();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: primaryColor,
                    ),
                    child: const Text("Register"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
