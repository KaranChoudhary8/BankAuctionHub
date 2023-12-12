import 'package:flutter/material.dart';

//libraies
const propertyCollection = "Properties";
const userCollection = "Users";

//colors
const primaryColor = Color(0xFF8260FF);
const primaryOffColor = Color(0xFFEEEAFF);
const greyColor = Color(0xFF808080);
const whiteColor = Color(0xFFFFFFFF);
const List<Color> colorsList = [
  Color(0xFF8260FF),
  Color(0xFFaa60ff),
  Color(0xFFff6080),
  Color(0xFF3da64b),
  Color(0xFF75a63d),
  Color(0xFFa69c3d),
  Color(0xFFa65e3d),
  Color(0xFFe04641),
];

//values
const screenPadding = 50.0;
const contentPadding = 25.0;
const sidePanelWidth = 250.0;

//icons
const profileIcon = "assets/icons/profile.svg";
const usersIcon = "assets/icons/users.svg";
const homeIcon = "assets/icons/home.svg";
const addIcon = "assets/icons/add.svg";
const adminIcon = "assets/icons/admin.svg";
const arrowIcon = "assets/icons/arrow.svg";
const emailIcon = "assets/icons/email.svg";
const phoneIcon = "assets/icons/phone.svg";
const eyeIcon = "assets/icons/eye.svg";
const eyeClosedIcon = "assets/icons/eye_closed.svg";
const lockIcon = "assets/icons/lock.svg";
const calenderIcon = "assets/icons/calender.svg";
const timeIcon = "assets/icons/time.svg";
const searchIcon = "assets/icons/search.svg";
const filterIcon = "assets/icons/filter.svg";
const logoutIcon = "assets/icons/logout.svg";
const areaIcon = "assets/icons/area.svg";
const locationIcon = "assets/icons/location.svg";
const bankIcon = "assets/icons/bank.svg";

//Screens
const homeScreenRoute = '/';
const loginScreenRoute = '/login';
const forgotPasswordScreenRoute = '/forgot';
const registerScreenRoute = '/register';
const addPropertyScreenRoute = '/addpropert';
const adminScreenRoute = '/admin';
const usersScreenRoute = '/users';
const profileScreenRoute = '/profile';
const errorScreenRoute = '/404';
const detailScreenRoute = '/detail';

//Custom decorations
OutlineInputBorder myInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: greyColor),
  borderRadius: BorderRadius.circular(4),
);
