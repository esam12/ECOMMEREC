import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceCount extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const PriceCount(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primaryColor,
          ),
          child: IconButton(
              onPressed: onAdd,
              icon: const Icon(
                Icons.add,
                size: 20,
              )),
        ),
        Text(
          count,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.1),
        ),
        Container(
          height: 35,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primaryColor,
          ),
          child: IconButton(
              onPressed: onRemove,
              icon: const Icon(
                Icons.remove,
                size: 20,
              )),
        ),
        const Spacer(),
        Text(
          "$price \$",
          style: const TextStyle(
              fontSize: 25, height: 1.1, color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
