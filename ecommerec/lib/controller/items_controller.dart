import 'package:ecommerec/controller/homepage_controller.dart';
import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/items.dart';
import 'package:ecommerec/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, String catVal);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  String? catid;
  List data = [];
  StatusRequest statusrequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catid = Get.arguments['categoryid'];
    getItems(catid!);
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
    initialData();
  }

  @override
  changeCat(val, catVal) {
    selectedCat = val;
    catid = catVal;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
}
