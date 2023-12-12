import 'package:bank_auction_hub/Custom%20Widgets/radio_title_widget.dart';
import 'package:bank_auction_hub/Functions/register_validation.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:bank_auction_hub/bloc/Register/register_cubit.dart';
import 'package:bank_auction_hub/bloc/cubit/auth_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //key
    final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
    //controllers
    final TextEditingController _fullName = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _phone = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController _confirmPassword = TextEditingController();
    final TextEditingController _bankName = TextEditingController();

    bool isBankerSelected = false;

    final registerFormCubit = BlocProvider.of<RegisterCubit>(context);
    final authCubit = BlocProvider.of<AuthCubitCubit>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: Responsive.isMobile(context)
            ? const EdgeInsets.symmetric(horizontal: contentPadding)
            : const EdgeInsets.symmetric(horizontal: screenPadding),
        child: Form(
          key: _registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's Register!",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const Text("Fill the information and join us..."),
              const SizedBox(
                height: 30,
              ),

              //Fullname
              TextFormField(
                controller: _fullName,
                validator: registerFullnameValidation,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  prefixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        profileIcon,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                        colorFilter: const ColorFilter.mode(
                            primaryColor, BlendMode.srcIn),
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

              //Email
              TextFormField(
                controller: _email,
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
                        colorFilter: const ColorFilter.mode(
                            primaryColor, BlendMode.srcIn),
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

              //phoneNumber
              TextFormField(
                controller: _phone,
                validator: registerPhoneValidation,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  prefixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        phoneIcon,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                        colorFilter: const ColorFilter.mode(
                            primaryColor, BlendMode.srcIn),
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
              BlocBuilder<RegisterCubit, RegisterFormState>(
                builder: (context, state) {
                  return TextFormField(
                    controller: _password,
                    validator: registerPasswordValidation,
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
                                primaryColor, BlendMode.srcIn),
                          ),
                        ),
                        onPressed: () {
                          registerFormCubit.togglePasswordVisibility();
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

              //Confirm Password
              BlocBuilder<RegisterCubit, RegisterFormState>(
                builder: (context, state) {
                  return TextFormField(
                    controller: _confirmPassword,
                    validator: (value) {
                      return registerConfirmPasswordValidation(
                          value, _password.text.toString());
                    },
                    obscureText: !state.isConfirmVisible,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      suffixIcon: IconButton(
                        icon: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SvgPicture.asset(
                            state.isConfirmVisible ? eyeClosedIcon : eyeIcon,
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                                primaryColor, BlendMode.srcIn),
                          ),
                        ),
                        onPressed: () {
                          registerFormCubit.toggleConfirmVisibility();
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
              const Text(
                "Register as: ",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              BlocBuilder<RegisterCubit, RegisterFormState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          MyRadioTile(
                            title: "Bidder",
                            isSelected: !state.isBanker,
                            onTap: () {
                              isBankerSelected = false;
                              registerFormCubit.selectedRadio(false);
                            },
                          ),
                          const SizedBox(
                            width: contentPadding,
                          ),
                          MyRadioTile(
                            title: "Banker",
                            isSelected: state.isBanker,
                            onTap: () {
                              isBankerSelected = true;
                              registerFormCubit.selectedRadio(true);
                            },
                          )
                        ],
                      ),
                      if (state.isBanker)
                        //Bank Name
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _bankName,
                              validator: (value) {
                                if (state.isBanker) {
                                  return registerBanknameValidation(value);
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Bank Name",
                                prefixIcon: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SvgPicture.asset(
                                      bankIcon,
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.scaleDown,
                                      colorFilter: const ColorFilter.mode(
                                          primaryColor, BlendMode.srcIn),
                                    )),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),

              //Submit
              BlocConsumer<AuthCubitCubit, AuthCubitState>(
                listener: (context, state) {
                  
                  if (state is AuthLoggedInState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Account Created")));
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, homeScreenRoute);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState!.validate()) {
                        String nameStr = _fullName.text.toString().trim();
                        String emailStr = _email.text.toString();
                        String phoneStr = _phone.text.toString();
                        String passwordStr = _password.text.toString();
                        String bankNameStr = _bankName.text.toString().trim();
                        

                        authCubit.registerUser(nameStr, emailStr, phoneStr,
                            passwordStr, bankNameStr, isBankerSelected);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(64),
                        foregroundColor: whiteColor,
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),

              //haveAccount Login
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text("Already have account?"),

                    //haveAccount Login
                    TextButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushReplacementNamed(
                            context, loginScreenRoute);
                        authCubit.goToLogin();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: primaryColor,
                      ),
                      child: const Text("Login"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
