import 'package:ecommerec/controller/myfavoritedata_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/view/widget/customeappbar.dart';
import 'package:ecommerec/view/widget/myfavorite/customefavoritelist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteDataControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteDataControllerImp>(
          builder: (controller) => ListView(
            children: [
              // CustomAppBar(
              //   titleappbar: "Find Product",
              //   onPressedSearch: () {},
              //   onPressedFavorite: () {
              //     //Get.toNamed(AppRoute.myfavorite);
              //   },
              // ),
              HandlingData(
                  statusRequest: controller.statusrequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: ((context, index) {
                        return CustomFavoriteList(
                            itemsModel: controller.data[index]);
                      })))
            ],
          ),
        ),
      ),
    );
  }
}
