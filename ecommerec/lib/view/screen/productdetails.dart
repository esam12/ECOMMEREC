import 'package:ecommerec/controller/productdetails_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/view/widget/productdetails/price_count.dart';
import 'package:ecommerec/view/widget/productdetails/subitemslist.dart';
import 'package:ecommerec/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 40,
          child: MaterialButton(
            color: AppColor.secondColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              controller.controller.refreshPage();
              Get.toNamed(AppRoute.cart);
            },
            child: const Text(
              "Go To Cart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingData(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const TopPageProductDetails(),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.itemsModel.itemsName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      color:
                                          const Color.fromARGB(255, 2, 55, 81)),
                            ),
                            const SizedBox(height: 10),
                            PriceCount(
                              onAdd: () {
                                controller.add();
                              },
                              onRemove: () {
                                controller.delete();
                              },
                              price:
                                  controller.itemsModel.itemsPrice.toString(),
                              count: "${controller.countitems}",
                            ),
                            const SizedBox(height: 10),
                            Text(
                                "${controller.itemsModel.itemsDesc}"
                                "${controller.itemsModel.itemsDesc}"
                                "${controller.itemsModel.itemsDesc}"
                                "${controller.itemsModel.itemsDesc}"
                                "${controller.itemsModel.itemsDesc}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans")),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Color",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: AppColor.thirdColor),
                            ),
                            const SizedBox(height: 10),
                            const SubItemsList(),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
