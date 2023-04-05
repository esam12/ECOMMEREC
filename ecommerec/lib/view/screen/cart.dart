import 'package:ecommerec/controller/cart_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/view/widget/cart/custombottomnavigationbar.dart';
import 'package:ecommerec/view/widget/cart/customcardview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        //   backgroundColor: Colors.grey[50],
        title: const Text("My Cart"),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => CustomBottomNavigationBar(
            onApply: () {
              cartController.checkCouponName();
            },
            controllercoupon: cartController.coupontext,
            price: "${cartController.priceorders}",
            discount: "${cartController.coupondiscount}%",
            shipping: "${10}",
            totalprice: "${cartController.getTotalPrice()}"),
      ),
      body: GetBuilder<CartController>(
        builder: ((controller) => HandlingDataRequest(
              statusRequest: cartController.statusrequest,
              widget: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(
                          cartController.data.length,
                          (index) => CustomCardView(
                              name: "${cartController.data[index].itemsName}",
                              price:
                                  "${cartController.data[index].itemsprice}\$",
                              count: "${cartController.data[index].countitems}",
                              image: '${cartController.data[index].itemsImage}',
                              onAdd: () async {
                                await cartController
                                    .add(cartController.data[index].itemsId!);
                                cartController.refreshPage();
                              },
                              onRemove: () async {
                                await cartController.delete(
                                    cartController.data[index].itemsId!);
                                cartController.refreshPage();
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
