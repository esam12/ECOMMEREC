import 'package:ecommerec/controller/auth/successsignup_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
 const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: AppColor.grey,
        ),
        title: Text("Success",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 270,
              color: AppColor.primaryColor,
            ),
          ),
          const Text("Congratulations"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
                text: "Go To Login",
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }
}
