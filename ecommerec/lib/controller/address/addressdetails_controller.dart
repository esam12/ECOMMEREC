import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? long;

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  addaddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.addaddress(
        name!.text,
        myServices.sharedPreferences.getString("id")!,
        city!.text,
        street!.text,
        lat!,
        long!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
