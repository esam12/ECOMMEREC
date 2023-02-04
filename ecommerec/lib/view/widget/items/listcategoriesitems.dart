import 'package:ecommerec/controller/items_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/functions/translatedatabase.dart';
import 'package:ecommerec/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Categories(
            i: index,
            categoriesmodel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        }),
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesmodel;
  final int? i;
  const Categories({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        controller.changeCat(i!, categoriesmodel.categoriesId!);
        //controller.geToItems(controller.categories, i!);
      }),
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 5),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 3, color: AppColor.primaryColor),
                      ),
                    )
                  : null,
              child: Text(
                "${translatDatabase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
                style: const TextStyle(color: AppColor.grey_800, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
