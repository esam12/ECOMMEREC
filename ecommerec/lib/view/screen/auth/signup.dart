import 'package:ecommerec/controller/auth/signup_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/functions/validinput.dart';
import 'package:ecommerec/view/widget/auth/cusromtexttitleauth.dart';
import 'package:ecommerec/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerec/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerec/view/widget/auth/customtextformauth.dart';
import 'package:ecommerec/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SignUpControllerImp());
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: AppColor.grey,
        ),
        title: Text('17'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.fromstate,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextTitleAuth(text: "10".tr),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(text: "24".tr),
                  const SizedBox(height: 50),
                  CustomTextFormAuth(
                      type: TextInputType.text,
                      valid: (val) {
                        return validinput(val!, 5, 100, "username");
                      },
                      mycontroller: controller.username,
                      hinttext: "23".tr,
                      labeltext: "20".tr,
                      iconData: Icons.person_outline),
                  const SizedBox(height: 30),
                  CustomTextFormAuth(
                      type: TextInputType.emailAddress,
                      valid: (val) {
                        return validinput(val!, 5, 100, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "12".tr,
                      labeltext: "18".tr,
                      iconData: Icons.mail_outline),
                  const SizedBox(height: 30),
                  CustomTextFormAuth(
                      type: TextInputType.phone,
                      valid: (val) {
                        return validinput(val!, 5, 100, "phone");
                      },
                      mycontroller: controller.phone,
                      hinttext: "22".tr,
                      labeltext: "21".tr,
                      iconData: Icons.phone_android_outlined),
                  const SizedBox(height: 30),
                  CustomTextFormAuth(
                      type: TextInputType.visiblePassword,
                      valid: (val) {
                        return validinput(val!, 5, 100, "password");
                      },
                      mycontroller: controller.password,
                      hinttext: "13".tr,
                      labeltext: "19".tr,
                      iconData: Icons.lock_outline),
                  const SizedBox(height: 20),
                  CustomButtonAuth(
                      text: "17".tr,
                      onPressed: () {
                        controller.signUp();
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextSignUpOrSignIn(
                      textone: "25".tr,
                      texttwo: "26".tr,
                      onTap: () {
                        controller.goToSignIn();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
