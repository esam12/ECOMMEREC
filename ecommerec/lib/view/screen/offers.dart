import 'package:ecommerec/controller/favorite_controller.dart';
import 'package:ecommerec/controller/offers_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/view/screen/homepage.dart';
import 'package:ecommerec/view/screen/offers/customListdata.dart';
import 'package:ecommerec/view/widget/customeappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    Get.put(FavoriteController());
    return GetBuilder<OffersController>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(children: [
          CustomAppBar(
            mycontroller: controller.search!,
            onChanged: (val) {
              controller.checkSearch(val);
            },
            titleappbar: "Find Product",
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onPressedFavorite: () {
              Get.toNamed(AppRoute.myfavorite);
            },
          ),
          !controller.isSearch
              ? HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) =>
                        CustomListData(itemsModel: controller.data[index]),
                  ),
                )
              : ListItemsSearch(
                  listdataModel: controller.listdata,
                ),
        ]),
      ),
    );
  }
}
