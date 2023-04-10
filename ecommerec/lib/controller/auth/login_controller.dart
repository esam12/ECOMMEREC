import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPass();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();

  late TextEditingController email;
  late TextEditingController password;
  bool isShowPass = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  login() async {
    var formdata = fromstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone'].toString());
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users$userid");
            //data.addAll(response['data']);
            Get.offNamed(AppRoute.homepage);
          } else {
            Get.toNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Waring", middleText: "Email or password not corect");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToForgetPass() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print(token);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
