import 'package:ecommerec/controller/homepage_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/functions/translatedatabase.dart';
import 'package:ecommerec/data/model/categoriesmodel.dart';
import 'package:ecommerec/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesListViewHome extends GetView<HomePageControllerImp> {
  const CategoriesListViewHome({super.key});

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

class Categories extends GetView<HomePageControllerImp> {
  final CategoriesModel categoriesmodel;
  final int? i;
  const Categories({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        controller.geToItems(
            controller.categories, i!, categoriesmodel.categoriesId!);
      }),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 206, 173),
                borderRadius: BorderRadius.circular(20)),
            height: 60,
            width: 90,
            child: SvgPicture.asset(
                "${AppLinkApi.imagestatic}/${categoriesmodel.categoriesImage}",
                color: AppColor.primaryColor),
          ),
          Text(
            "${translatDatabase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
