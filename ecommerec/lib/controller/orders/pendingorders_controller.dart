import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/orders/pendingorders_data.dart';
import 'package:ecommerec/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class PendingOrdersController extends GetxController {
  PendingOrdersData pendingorders = PendingOrdersData(Get.find());
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getOrdersPendingData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingorders
        .getPendingData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String printTypeOrder(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Drive Thru";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash on delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The Order is being prepared";
    } else if (val == "2") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  refreshOrders() {
    getOrdersPendingData();
  }

  @override
  void onInit() {
    getOrdersPendingData();
    super.onInit();
  }
}
