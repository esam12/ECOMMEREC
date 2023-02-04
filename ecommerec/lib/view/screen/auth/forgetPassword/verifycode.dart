import 'package:ecommerec/controller/auth/forgetpassword/verifycode_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/view/widget/auth/cusromtexttitleauth.dart';
import 'package:ecommerec/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          leading: const Icon(
            Icons.arrow_back_rounded,
            color: AppColor.grey,
          ),
          title: Text("Verification Code",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(text: "Check Code"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                      text:
                          "Please Enter The Digit Code Sent To isam@gmail.com For Reset Your Password"),
                  const SizedBox(height: 50),
                  OtpTextField(
                      fieldWidth: 50.0,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: AppColor.primaryColor,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.goToResetPassword(verificationCode);
                      }),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ));
  }
}
