import 'package:ecommerec/controller/cart_controller.dart';
import 'package:ecommerec/view/widget/cart/appbarcart.dart';
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
      bottomNavigationBar: CustomBottomNavigationBar(
          price: "${cartController.priceorders}",
          shipping: "300",
          totalprice: "1500"),
      body: ListView(
        children: [
          const AppBarCart(
            title: 'My Cart',
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ...List.generate(
                  cartController.data.length,
                  (index) => CustomCardView(
                    name: "${cartController.data[index].itemsName}",
                    price: "${cartController.data[index].itemsPrice}\$",
                    count: "${cartController.data[index].countitems}",
                    image: '${cartController.data[index].itemsImage}',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
