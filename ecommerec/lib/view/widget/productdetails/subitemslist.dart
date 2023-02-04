import 'package:ecommerec/controller/productdetails_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItemsColors.length,
          ((index) => Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.only(bottom: 5),
                height: 60,
                width: 90,
                decoration: BoxDecoration(
                    color: controller.subItemsColors[index]['active'] == "1"
                        ? AppColor.thirdColor
                        : null,
                    border: Border.all(color: AppColor.thirdColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  controller.subItemsColors[index]['name'],
                  style: TextStyle(
                      color: controller.subItemsColors[index]['active'] == "1"
                          ? Colors.white
                          : AppColor.thirdColor,
                      fontWeight: FontWeight.bold),
                ),
              )),
        )
      ],
    );
  }
}
