import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/favorite.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  StatusRequest statusrequest = StatusRequest.none;
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  List data = [];

  // key   => id items
  // value => 1 (active) or 0(!active)

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notefication",
            messageText: const Text("The item has been added"));

        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
   // update();
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notefication",
            messageText: const Text("The item has been deleted"));
        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
  //  update();
  }
}
