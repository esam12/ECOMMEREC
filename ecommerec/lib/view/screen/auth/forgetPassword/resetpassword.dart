import 'package:ecommerec/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/functions/validinput.dart';
import 'package:ecommerec/view/widget/auth/cusromtexttitleauth.dart';
import 'package:ecommerec/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerec/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerec/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: AppColor.grey,
        ),
        title: Text("Reset Password",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.fromstate,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(text: "New Password"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(text: "Please Enter new Password"),
                  const SizedBox(height: 50),
                  CustomTextFormAuth(
                      type: TextInputType.visiblePassword,
                      valid: (val) {
                        return validinput(val!, 5, 25, "password");
                      },
                      mycontroller: controller.password,
                      hinttext: "Enter Your New Password",
                      labeltext: "Password",
                      iconData: Icons.mail_outline),
                  const SizedBox(height: 20),
                  CustomButtonAuth(
                      text: "Save",
                      onPressed: () {
                        controller.goToSuccessResetPassword();
                      }),
                  const SizedBox(
                    height: 40,
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
