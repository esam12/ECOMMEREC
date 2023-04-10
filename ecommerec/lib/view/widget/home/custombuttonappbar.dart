import 'package:ecommerec/controller/homescreen_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnAppBar extends StatelessWidget {
  final void Function()? onPressed;
  //final String textButton;
  final IconData iconData;
  final bool active;
  const CustomButtonOnAppBar(
      {super.key,
      required this.onPressed,
      //required this.textButton,
      required this.iconData,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: ((controller) => MaterialButton(
            onPressed: onPressed,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(iconData,
                    color: active == true
                        ? AppColor.primaryColor
                        : AppColor.grey_800),
                // Text(
                //   textButton,
                //   style: TextStyle(
                //       color: active == true
                //           ? AppColor.primaryColor
                //           : AppColor.grey_800),
                // )
              ],
            ),
          )),
    );
  }
}
