import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:ecommerec/data/datasource/remote/cart_data.dart';
import 'package:ecommerec/data/model/cartmodel.dart';
import 'package:ecommerec/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController? coupontext;
  MyServices myServices = Get.find();
  int? coupondiscount = 0;
  String? couponname;
  CouponModel? couponModel;
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;
  String? couponid;
  StatusRequest statusrequest = StatusRequest.none;
  CartData cartdata = CartData(Get.find());

  add(String itemsid) async {
    statusrequest = StatusRequest.loading;
    update();
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
    update();
  }

  delete(String itemsid) async {
    statusrequest = StatusRequest.loading;
    update();
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
    update();
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

  goToPageCheckOut() {
    if (data.isEmpty) return Get.snackbar("Warning", "The basket isEmpty");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "orderprice": priceorders.toString(),
      "ordersdiscount": coupondiscount
    });
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await cartdata
        .viewCartData(myServices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders =
              double.parse(dataresponsecountprice['totalprice'].toString());
        }
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  getTotalPrice() {
    return (priceorders - priceorders * coupondiscount! / 100);
  }

  checkCouponName() async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await cartdata.checkCoupon(coupontext!.text);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        coupondiscount = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId.toString();
      } else {
        coupondiscount = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Error", "Coupon Not Valid ");
      }
    }
    update();
  }

  @override
  void onInit() {
    coupontext = TextEditingController();
    view();
    super.onInit();
  }
}
