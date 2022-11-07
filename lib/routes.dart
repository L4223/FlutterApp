import 'package:get/get.dart';
import 'package:list/pages/chart_page.dart';
import 'package:list/pages/fav_page.dart';
import 'package:list/pages/home.dart';
import 'package:list/pages/list_page.dart';
import 'package:list/pages/login_page.dart';
import 'package:list/pages/profile_page.dart';
import 'package:list/pages/register/phone_input_page.dart';

import 'package:list/pages/register/pin_input_page.dart';
import 'package:list/pages/register/register_page.dart';

class RoutesClass {
  static List<GetPage> routes = [
    GetPage(
        name: "/home",
        page: () => const HomePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: "/login",
        page: () => const LoginPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: "/favorites",
        page: () => const FavoritesPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: "/phone",
        page: () => const PhonePage(),
        transition: Transition.fadeIn),
    GetPage(name: "/pin", page: () => PinPage(), transition: Transition.fadeIn),
    GetPage(
        name: "/register",
        page: () => const RegisterPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: "/list",
        page: () => const ListPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: "/chart",
        page: () => const ChartPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: "/profileInput",
        page: () => ProfileInputPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: "/profile",
        page: () => ProfilePage(),
        transition: Transition.fadeIn)
  ];

  // Get.to
  // Get.back
  // Get.off = nicht mehr Rückgängig
}
