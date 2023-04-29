import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/orders/archive_data.dart';
import 'package:ecommerec/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class ArchiveOrdersController extends GetxController {
  ArchiveOrdersData archiveorders = ArchiveOrdersData(Get.find());
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getArchiveOrdersData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveorders
        .getArchiveData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(
          listdata.map((e) => OrdersModel.fromJson(e)),
        );
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
    } else if (val == "3") {
      return "sent delivered handed";
    } else {
      return "Archive";
    }
  }

  refreshOrders() {
    getArchiveOrdersData();
  }

  submitRating(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await archiveorders.getRating(ordersid, rating.toString(), comment);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        getArchiveOrdersData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getArchiveOrdersData();
    super.onInit();
  }
}
