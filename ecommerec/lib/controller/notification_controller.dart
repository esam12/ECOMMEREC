import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/notification.dart';
import 'package:ecommerec/data/model/notificationmodel.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  NotificationData notificationData = Get.put(NotificationData(Get.find()));
  MyServices myServices = Get.find();
  List<NotificationModel> data = [];

  getNotificationDatas() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData
        .getNotifyData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getNotificationDatas();
    super.onInit();
  }
}
