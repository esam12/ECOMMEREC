import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';

class CartPaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive;
  const CartPaymentMethod(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isActive ? AppColor.secondColor : AppColor.fourthColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
            color: isActive ? Colors.white : AppColor.secondColor,
            height: 2,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
