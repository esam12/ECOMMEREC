import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;

  const CustomBottomNavigationBar(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Price",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "$price \$",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Shipping",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "$shipping \$",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Total Price",
                style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "$totalprice \$",
                style:
                    const TextStyle(fontSize: 16, color: AppColor.primaryColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "Place Order",
          onPressed: (() {}),
        )
      ],
    );
  }
}
