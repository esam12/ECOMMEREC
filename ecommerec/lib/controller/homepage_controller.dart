import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/home.dart';
import 'package:ecommerec/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomePageController extends SearchMixController {
  initialData();
  getData();
  geToItems(List categories, int selectedCat, String categoryid);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();
  String? username;
  String? lang;

  List categories = [];
  List items = [];

  HomeData homeData = HomeData(Get.find());

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusrequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  geToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.itemscreen, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "categoryid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  TextEditingController? search;
  HomeData homeData = HomeData(Get.find());
  List<ItemsModel> listdata = [];

  bool isSearch = false;

  StatusRequest statusrequest = StatusRequest.none;

  checkSearch(val) {
    if (val == "") {
      statusrequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusrequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }
}
