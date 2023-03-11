import 'package:ecommerec/view/screen/homepage.dart';
import 'package:ecommerec/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const HomePage(),
    Column(
      children: const [
        // Settings(),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Favorite"),
        )
      ],
    ),
   const Settings(),
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Noti", "icon": Icons.notifications},
    {"title": "Profile", "icon": Icons.person},
    {"title": "Settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
