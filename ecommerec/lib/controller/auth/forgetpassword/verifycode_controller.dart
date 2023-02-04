import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/data/datasource/remote/forgetpassword/resetpasswordverifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkcode();
  goToResetPassword(String verifycodeResetPass);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  //late String verifycode;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  ResetPassVerifyCodeData resetpassverifycode =
      ResetPassVerifyCodeData(Get.find());
  @override
  checkcode() {}

  @override
  goToResetPassword(String verifycodeResetPass) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await resetpassverifycode.postData(email!, verifycodeResetPass);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        Get.offNamed(AppRoute.resetPass, arguments: {"email": email});
      } else {
        update();
        Get.defaultDialog(
            title: "Waring",
            middleText:
                "Verify Code Not Correct.");
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
