import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/cart_data.dart';
import 'package:ecommerec/data/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;
  StatusRequest statusrequest = StatusRequest.none;
  CartData cartdata = CartData(Get.find());
  add(String itemsid) async {
    statusrequest = StatusRequest.loading;
    var response = await cartdata.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid.toString());
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notefication",
            messageText: const Text("The item has been added to basket"));

        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
  }

  delete(String itemsid) async {
    statusrequest = StatusRequest.loading;
    var response = await cartdata.deleteData(
        myServices.sharedPreferences.getString("id")!, itemsid.toString());
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notefication",
            messageText: const Text("The item has been added to basket"));
        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
  }

  getcountItems(String itemsid) async {
    statusrequest = StatusRequest.loading;
    var response = await cartdata.getCountItemsData(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = (response['data']);
        return countitems;
        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
  }

  view() async {
    statusrequest = StatusRequest.loading;
    var response = await cartdata
        .viewCartData(myServices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List dataresponse = response['datacart'];
        Map dataresponsecountprice = response['countprice'];
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
        totalcountitems = int.parse(dataresponsecountprice['totalcount']);
        priceorders =
            double.parse(dataresponsecountprice['totalprice'].toString());
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
