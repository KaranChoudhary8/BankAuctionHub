import 'package:bank_auction_hub/Custom%20Widgets/input_fields_widget.dart';
import 'package:bank_auction_hub/Custom%20Widgets/profile_photo.dart';
import 'package:bank_auction_hub/Functions/firebase_getter.dart';
import 'package:bank_auction_hub/Functions/register_validation.dart';
import 'package:bank_auction_hub/Models/user_model.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/bloc/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});
  final GlobalKey<FormState> _informationkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _newPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    bool isEditing = false;

    return SingleChildScrollView(
      child: StreamBuilder(
          stream: getCurrentUserModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (!snapshot.hasData) {
              return const Text("Something not Right");
            } else {
              UserModel userModel = snapshot.data!;
              String? fullname;
              String? phone;
              String newPassword = "";
              String oldPassword = "";
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: primaryColor),
                      child: Center(
                          child: Text(
                        userModel.isBanker ? "Banker Profile" : "User Profile",
                        style: const TextStyle(color: whiteColor, fontSize: 16),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: screenPadding,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        MyProfilePic(
                            text: userModel.profile,
                            isHeader: false,
                            color: colorsList[userModel.color]),
                        const SizedBox(
                          width: contentPadding,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userModel.email,
                              softWrap: true,
                              style: const TextStyle(fontSize: 32),
                            ),
                            if (userModel.isBanker)
                              Text(
                                userModel.bankname ?? "",
                                softWrap: true,
                                style: const TextStyle(
                                    fontSize: 18, color: greyColor),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: contentPadding,
                  ),
                  BlocConsumer<ProfileCubit, ProfileCubitState>(
                    listener: (context, state) {
                      if (state is ProfileCubitEditingState ||
                          state is ProfileCubitEditingLoadingState) {
                        isEditing = true;
                      } else {
                        isEditing = false;
                      }
                      if (state is ProfileCubitErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMsg)));
                      } else if (state is ProfileCubitSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.successMsg)));
                      }
                    },
                    builder: (context, state) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Other Details",
                                  style: TextStyle(fontSize: 20),
                                ),
                                TextButton(
                                    onPressed: () {
                                      profileCubit.startEditing(!isEditing);
                                    },
                                    child: Text(
                                      isEditing ? "Cancel" : "Edit",
                                      style: const TextStyle(
                                          decoration: TextDecoration.underline),
                                    ))
                              ],
                            ),
                            Form(
                              key: _informationkey,
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                runAlignment: WrapAlignment.spaceBetween,
                                runSpacing: contentPadding,
                                direction: Axis.horizontal,
                                children: [
                                  InputFieldWidget(
                                    isExpanded: false,
                                    label: "Fullname",
                                    child: TextFormField(
                                        onSaved: (newValue) {
                                          fullname = newValue;
                                        },
                                        initialValue: userModel.fullname,
                                        validator: registerFullnameValidation,
                                        readOnly: !isEditing,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                            prefixIcon: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: SvgPicture.asset(
                                                  profileIcon,
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.scaleDown,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          primaryColor,
                                                          BlendMode.srcIn),
                                                )),
                                            hintText: "yourName",
                                            border: myInputBorder)),
                                  ),
                                  InputFieldWidget(
                                    isExpanded: false,
                                    label: "Phone",
                                    child: TextFormField(
                                        onSaved: (newValue) {
                                          phone = newValue;
                                        },
                                        initialValue: userModel.phone,
                                        validator: registerPhoneValidation,
                                        readOnly: !isEditing,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                            prefixIcon: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: SvgPicture.asset(
                                                  phoneIcon,
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.scaleDown,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          primaryColor,
                                                          BlendMode.srcIn),
                                                )),
                                            hintText: "phone",
                                            border: myInputBorder)),
                                  ),
                                  if (state is ProfileCubitEditingState)
                                    Align(
                                      alignment: Alignment.center,
                                      child: InputFieldWidget(
                                        label: "",
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 52,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                foregroundColor: whiteColor,
                                                backgroundColor: primaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6))),
                                            onPressed: () {
                                              if (_informationkey.currentState!
                                                  .validate()) {
                                                //do stuff;
                                                _informationkey.currentState
                                                    ?.save();

                                                profileCubit.updateInformation(
                                                    userModel, fullname, phone);
                                              }
                                            },
                                            child: const Text(
                                                "Update Information"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (state is ProfileCubitEditingLoadingState)
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  const SizedBox(
                                    width: double.infinity,
                                  )
                                ],
                              ),
                            )
                          ]);
                    },
                  ),
                  const SizedBox(
                    height: contentPadding,
                  ),
                  // change Password
                  BlocBuilder<ProfileCubit, ProfileCubitState>(
                    builder: (context, state) {
                      var temp = TextEditingController();
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (state is ProfileCubitNewPasswordState) {
                                    } else {
                                      profileCubit.enableChangePassword();
                                    }
                                  },
                                  child: const Text(
                                    "Change Password",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 18,
                                        color: primaryColor),
                                  ),
                                ),
                                if (state is ProfileCubitNewPasswordState)
                                  TextButton(
                                      onPressed: () {
                                        profileCubit.disableChangePassword();
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      ))
                              ],
                            ),
                            if (state is ProfileCubitNewPasswordState ||
                                state is ProfileCubitPasswordLoadingState)
                              Form(
                                key: _newPasswordKey,
                                child: Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  runAlignment: WrapAlignment.spaceBetween,
                                  runSpacing: contentPadding,
                                  direction: Axis.horizontal,
                                  children: [
                                    InputFieldWidget(
                                      isExpanded: false,
                                      label: "Current Password",
                                      child: TextFormField(
                                          obscureText: true,
                                          onSaved: (newValue) {
                                            oldPassword = newValue!;
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please Enter Password";
                                            }
                                            return null;
                                          },
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                              prefixIcon: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: SvgPicture.asset(
                                                    lockIcon,
                                                    width: 20,
                                                    height: 20,
                                                    fit: BoxFit.scaleDown,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            primaryColor,
                                                            BlendMode.srcIn),
                                                  )),
                                              hintText: "*********",
                                              border: myInputBorder)),
                                    ),
                                    InputFieldWidget(
                                      isExpanded: false,
                                      label: "New Password",
                                      child: TextFormField(
                                          obscureText: true,
                                          validator: registerPasswordValidation,
                                          controller: temp,
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                              prefixIcon: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: SvgPicture.asset(
                                                    lockIcon,
                                                    width: 20,
                                                    height: 20,
                                                    fit: BoxFit.scaleDown,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            primaryColor,
                                                            BlendMode.srcIn),
                                                  )),
                                              hintText: "*********",
                                              border: myInputBorder)),
                                    ),
                                    InputFieldWidget(
                                      isExpanded: false,
                                      label: "Confirm New Password",
                                      child: TextFormField(
                                          onSaved: (newValue) {
                                            newPassword = temp.text.toString();
                                          },
                                          validator: (value) {
                                            String pass = temp.text.toString();
                                            if (pass != value) {
                                              return "New Password and new Confirm Password is not matching";
                                            }
                                            return null;
                                          },
                                          keyboardType: TextInputType.name,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                              prefixIcon: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: SvgPicture.asset(
                                                    lockIcon,
                                                    width: 20,
                                                    height: 20,
                                                    fit: BoxFit.scaleDown,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            primaryColor,
                                                            BlendMode.srcIn),
                                                  )),
                                              hintText: "*********",
                                              border: myInputBorder)),
                                    ),
                                    if (state is ProfileCubitNewPasswordState)
                                      InputFieldWidget(
                                          isExpanded: false,
                                          label: "",
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: 52,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  foregroundColor: whiteColor,
                                                  backgroundColor: primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6))),
                                              onPressed: () {
                                                if (_newPasswordKey
                                                    .currentState!
                                                    .validate()) {
                                                  _newPasswordKey.currentState
                                                      ?.save();
                                                  profileCubit.updatePassword(
                                                      oldPassword, newPassword);
                                                }
                                              },
                                              child:
                                                  const Text("Update Password"),
                                            ),
                                          )),
                                    if (state
                                        is ProfileCubitPasswordLoadingState)
                                      const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    const SizedBox(
                                      width: double.infinity,
                                    )
                                  ],
                                ),
                              )
                          ]);
                    },
                  ),
                ],
              );
            }
          }),
    );
  }
}
