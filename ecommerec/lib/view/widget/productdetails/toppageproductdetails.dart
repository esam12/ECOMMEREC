import 'package:ecommerec/controller/productdetails_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopPageProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
        ),
        Positioned(
          top: 10.0,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: Image.asset(
              "${AppLinkApi.imagestatic}/${controller.itemsModel.itemsImage}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
