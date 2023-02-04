import 'package:ecommerec/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/functions/validinput.dart';
import 'package:ecommerec/view/widget/auth/cusromtexttitleauth.dart';
import 'package:ecommerec/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerec/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerec/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: AppColor.grey,
        ),
        title: Text("ForgetPassword",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.fromstate,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(text: "Check Email"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                      text:
                          "Please Enter Your Email Address To Recive A Verification Code"),
                  const SizedBox(height: 50),
                  CustomTextFormAuth(
                      type: TextInputType.emailAddress,
                      valid: (val) {
                        return validinput(val!, 5, 100, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "Enter Your Email",
                      labeltext: "Email",
                      iconData: Icons.mail_outline),
                  const SizedBox(height: 20),
                  CustomButtonAuth(
                      text: "Check",
                      onPressed: () {
                        controller.checkemail();
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
