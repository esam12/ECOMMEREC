import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/home.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
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

  StatusRequest statusrequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
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
        categories.addAll(response['categories']);
        items.addAll(response['items']);
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
}
