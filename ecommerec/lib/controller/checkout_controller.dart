import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/address_data.dart';
import 'package:ecommerec/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  MyServices myServices = Get.find();
  List<AddressModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliveryType;
  String? addressId;

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

  @override
  void onInit() {
    getShippingAddress();
    super.onInit();
  }
}
