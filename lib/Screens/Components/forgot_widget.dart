import 'package:bank_auction_hub/Functions/register_validation.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/bloc/cubit/auth_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ForgotWidget extends StatelessWidget {
  const ForgotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //key
    final GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();

    final authCubit = BlocProvider.of<AuthCubitCubit>(context);
    String email = "";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenPadding),
      child: Form(
        key: forgotFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Forgot Password",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Enter Your email to get reset password link on your email",
              softWrap: true,
            ),
            const SizedBox(
              height: 50,
            ),

            //Email
            TextFormField(
              onSaved: (newValue) {
                email = newValue ?? "";
              },
              validator: registerEmailValidation,
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

            //Submit
            BlocConsumer<AuthCubitCubit, AuthCubitState>(
              listener: (context, state) {
                
                if (state is AuthLoginState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Email sent, Check your email")));

                  Navigator.pushReplacementNamed(context, loginScreenRoute);
                } else if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.errorMsg)));
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
                    if (forgotFormKey.currentState!.validate()) {
                      forgotFormKey.currentState!.save();
                      authCubit.forgotPassword(email);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(64),
                      foregroundColor: whiteColor,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  child: const Text(
                    "Send Email",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
