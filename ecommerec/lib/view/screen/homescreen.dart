import 'dart:io';

import 'package:ecommerec/controller/homescreen_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/view/widget/home/custombuttonappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: ((controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoute.cart);
              },
              child: const Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomButtonAppBarHome(),
            body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentpage),
              onWillPop: () {
                Get.defaultDialog(
                  title: "Warring",
                  titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.secondColor),
                  middleText: "Do You Want To Exit The App ?",
                  onCancel: () {},
                  cancelTextColor: AppColor.secondColor,
                  confirmTextColor: AppColor.secondColor,
                  buttonColor: AppColor.fourthColor,
                  onConfirm: () {
                    exit(0);
                  },
                );
                return Future.value(false);
              },
            ),
          )),
    );
  }
}
