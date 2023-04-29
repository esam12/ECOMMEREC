import 'package:ecommerec/controller/homepage_controller.dart';
import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/data/datasource/remote/offers_data.dart';
import 'package:ecommerec/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  StatusRequest statusRequest = StatusRequest.none;
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];

  getOffers() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getOffersData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getOffers();
    super.onInit();
  }
}
