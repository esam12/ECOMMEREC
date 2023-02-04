import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/favorite_data.dart';
import 'package:ecommerec/data/model/myvaforitemodel.dart';
import 'package:get/get.dart';

abstract class MyFavoriteDataController extends GetxController {
  getData();
}

class MyFavoriteDataControllerImp extends MyFavoriteDataController {
  MyServices myServices = Get.find();
  String? username;
  String? lang;
  List<MyFavoriteModel> data = [];

  StatusRequest statusrequest = StatusRequest.none;
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusrequest = StatusRequest.loading;
    var response = await myFavoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responesData = response['data'];
        data.addAll(responesData.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    var response = myFavoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
    update();
  }
}
