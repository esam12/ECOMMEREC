import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/address_data.dart';
import 'package:ecommerec/data/datasource/remote/checkout_data.dart';
import 'package:ecommerec/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));
  MyServices myServices = Get.find();
  List<AddressModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";
  late String couponid;
  late String orderprice;
  late String discount;

  paymentAddressMethod(String val) {
    paymentMethod = val;
    update();
  }

  deliveryTypeMehtod(String val) {
    deliveryType = val;
    update();
  }

  shippingAddressMethod(String val) {
    addressId = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .viewaddress(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Warning", "Please select a pyment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Warning", "Please select a order type");
    }
    statusRequest = StatusRequest.loading;
    update();
    Map<String, String> data = {
      "usersid": myServices.sharedPreferences.getString("id")!,
      "address": addressId.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": orderprice,
      "orderscuopon": couponid.toString(),
      "ordersdiscount": discount.toString(),
      "paymentmethod": paymentMethod.toString()
    };
    var response = await checkOutData.getData(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Success", "The order was successfully :)");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("ُError", "Please try again!");
      }
    }
    update();
    
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    orderprice = Get.arguments['orderprice'];
    discount = Get.arguments['ordersdiscount'].toString();
    getShippingAddress();
    super.onInit();
  }
}
