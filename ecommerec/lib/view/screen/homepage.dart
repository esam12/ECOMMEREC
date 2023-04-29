import 'package:ecommerec/controller/homepage_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/data/model/itemsmodel.dart';
import 'package:ecommerec/linkapi.dart';
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
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
          HandlingData(
              statusRequest: controller.statusrequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.settings.isNotEmpty)
                          CustomCardHome(
                              title:
                                  "${controller.settings[0]['settings_titlehome']}",
                              body:
                                  "${controller.settings[0]['settings_bodyhome']}"),
                        const CustomItemsTitleHome(title: "Categories"),
                        const CategoriesListViewHome(),
                        const CustomItemsTitleHome(title: "Top Selling"),
                        const CustomItems(),
                        const CustomItemsTitleHome(title: "Offer"),
                        const CustomItems(),
                      ],
                    )
                  : ListItemsSearch(
                      listdataModel: controller.listdata,
                    )),
        ]),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listdataModel;
  const ListItemsSearch({super.key, required this.listdataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdataModel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdataModel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                            "${AppLinkApi.imagestatic}/${listdataModel[index].itemsImage}",
                            height: 100),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "${listdataModel[index].itemsImage}",
                          ),
                          subtitle: Text(
                            "${listdataModel[index].categoriesName}",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
