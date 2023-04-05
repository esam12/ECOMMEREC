import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';

class CartShippingAddress extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  const CartShippingAddress({super.key, required this.title, required this.subtitle, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.secondColor : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : null, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: isActive ? Colors.white : null),
        ),
      ),
    );
  }
}
