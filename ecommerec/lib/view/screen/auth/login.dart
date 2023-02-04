import 'package:ecommerec/controller/auth/login_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/functions/alertexitapp.dart';
import 'package:ecommerec/core/functions/validinput.dart';
import 'package:ecommerec/view/widget/auth/cusromtexttitleauth.dart';
import 'package:ecommerec/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerec/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerec/view/widget/auth/customtextformauth.dart';
import 'package:ecommerec/view/widget/auth/logoauth.dart';
import 'package:ecommerec/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: AppColor.grey,
        ),
        title: Text("Sing In",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.fromstate,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    const SizedBox(height: 20),
                    const CustomTextTitleAuth(text: "Welcome Back"),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(
                        text:
                            "Sign in with your eamil and  password\n or continue with social media"),
                    const SizedBox(height: 50),
                    CustomTextFormAuth(
                        type: TextInputType.emailAddress,
                        valid: (val) {
                          return validinput(val!, 5, 100, "email");
                        },
                        hinttext: "Enter Your Email",
                        labeltext: "Email",
                        mycontroller: controller.email,
                        iconData: Icons.mail_outline),
                    const SizedBox(height: 30),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustomTextFormAuth(
                          type: TextInputType.visiblePassword,
                          obscureText: controller.isShowPass,
                          valid: (val) {
                            return validinput(val!, 5, 25, "password");
                          },
                          hinttext: "Enter Your Password",
                          labeltext: "Password",
                          mycontroller: controller.password,
                          iconData: Icons.lock_outline,
                          onTapIcon: () {
                            controller.showPassword();
                          }),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        controller.goToForgetPass();
                      },
                      child: const Text(
                        "Forget Password",
                        textAlign: TextAlign.end,
                      ),
                    ),
                    CustomButtonAuth(
                        text: "SignIn",
                        onPressed: () {
                          controller.login();
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeTextSignUpOrSignIn(
                        textone: "Don't have an account ? ",
                        texttwo: "SignUp",
                        onTap: () {
                          controller.goToSignUp();
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
