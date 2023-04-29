import 'package:ecommerec/controller/homepage_controller.dart';
import 'package:ecommerec/data/model/itemsmodel.dart';
import 'package:ecommerec/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItems extends GetView<HomePageControllerImp> {
  const CustomItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Items(
              itemsmodel: ItemsModel.fromJson(controller.items[index]),
            );
          }),
    );
  }
}

class Items extends GetView<HomePageControllerImp> {
  final ItemsModel itemsmodel;
  const Items({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsmodel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              "${AppLinkApi.imagestatic}/${itemsmodel.itemsImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            height: 120,
            width: 180,
          ),
          Positioned(
            left: 25,
            top: -15,
            child: Text(
              "${itemsmodel.itemsName}",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
