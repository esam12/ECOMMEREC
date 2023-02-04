import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomItemsTitleHome extends StatelessWidget {
  final String title;
  const CustomItemsTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 21,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
