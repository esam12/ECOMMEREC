import 'package:ecommerec/controller/homepage_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/view/widget/home/customcardhome.dart';
import 'package:ecommerec/view/widget/home/customcategories.dart';
import 'package:ecommerec/view/widget/customeappbar.dart';
import 'package:ecommerec/view/widget/home/customitems.dart';
import 'package:ecommerec/view/widget/home/customitemstitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => HandlingData(
        statusRequest: controller.statusrequest,
        widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: ListView(children: [
            CustomAppBar(
              titleappbar: "Find Product",
              onPressedSearch: () {},
              onPressedFavorite: () {
                Get.toNamed(AppRoute.myfavorite);
              },
            ),
            const CustomCardHome(
                title: "A Summer Surprise", body: "Cashback 20%"),
            const CustomItemsTitleHome(title: "Categories"),
            const CategoriesListViewHome(),
            const CustomItemsTitleHome(title: "Product for you"),
            const CustomItems(),
            const CustomItemsTitleHome(title: "Offer"),
            const CustomItems(),
          ]),
        ),
      ),
    );
  }
}
