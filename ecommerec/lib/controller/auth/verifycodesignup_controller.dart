import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifycodeSignup);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeSignUp verifyCodeSignUp = VerifyCodeSignUp(Get.find());

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verifycodeSignup) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUp.postData(email!, verifycodeSignup);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        update();
        Get.defaultDialog(
            title: "Waring", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  void resend() {
    verifyCodeSignUp.reSendData(email!);
  }
}
