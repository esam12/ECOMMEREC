import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text;
  final String texttwo;
  final void Function()? onTap;
  const CustomTextSignUpOrSignIn(
      {super.key, required this.text, required this.texttwo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(texttwo),
        InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
