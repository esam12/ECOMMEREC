import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';

class CartChooseDelivery extends StatelessWidget {
  final String title;
  final bool isActive;
  final String image;
  const CartChooseDelivery(
      {super.key,
      required this.title,
      required this.isActive,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: isActive ? AppColor.secondColor : null,
          border: Border.all(color: AppColor.secondColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            color: !isActive ? null : Colors.white,
            width: 70,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : AppColor.secondColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
