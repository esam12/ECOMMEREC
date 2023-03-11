import 'package:ecommerec/view/widget/cart/appbarcart.dart';
import 'package:ecommerec/view/widget/cart/custombottomnavigationbar.dart';
import 'package:ecommerec/view/widget/cart/customcardview.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(
          price: "1200", shipping: "300", totalprice: "1500"),
      body: ListView(
        children: [
          const AppBarCart(
            title: 'My Cart',
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                CustomCardView(
                    name: "MacBook M1", price: "1100.0 \$", count: "4"),
                CustomCardView(
                    name: "MacBook M2 Max", price: "2100.0 \$", count: "1"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
