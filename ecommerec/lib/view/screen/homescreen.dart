import 'package:ecommerec/controller/homescreen_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
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
              onPressed: () {},
              child: const Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomButtonAppBarHome(),
            body: controller.listPage.elementAt(controller.currentpage),
          )),
    );
  }
}
