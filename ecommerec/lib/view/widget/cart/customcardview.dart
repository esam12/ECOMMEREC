import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomCardView(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.image,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              AppImageAsset.logo,
              height: 110,
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(name, style: const TextStyle(fontSize: 15)),
              subtitle: Text(
                price,
                style:
                    const TextStyle(fontSize: 15, color: AppColor.primaryColor),
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add),
              ),
              Text(count, style: const TextStyle(fontFamily: "sans")),
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.remove),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
