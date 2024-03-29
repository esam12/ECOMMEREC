import 'package:ecommerec/controller/favorite_controller.dart';
import 'package:ecommerec/controller/items_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/data/model/itemsmodel.dart';
import 'package:ecommerec/view/screen/homepage.dart';
import 'package:ecommerec/view/widget/customeappbar.dart';
import 'package:ecommerec/view/widget/items/customlistitems.dart';
import 'package:ecommerec/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
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
          const SizedBox(height: 20),
          const ListCategoriesItems(),
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => HandlingData(
                statusRequest: controller.statusrequest,
                widget: !controller.isSearch
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, index) {
                          controllerFav.isFavorite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favorite'];
                          return CustomListItems(
                            //active: true,
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]),
                          );
                        })
                    : ListItemsSearch(listdataModel: controller.listdata)),
          ),
        ]),
      ),
    );
  }
}
