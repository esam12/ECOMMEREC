import 'dart:async';

import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/data/datasource/remote/orders/details_data.dart';
import 'package:ecommerec/data/model/cartmodel.dart';
import 'package:ecommerec/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailController extends GetxController {
  late OrdersModel ordersModel;

  // المتغيرات من اجل الخريطة
  Completer<GoogleMapController>? completercontroller;
  List<Marker> markers = [];
  double? lat;
  double? long;
  CameraPosition? cameraPosition;

  List<CartModel> data = [];
  late StatusRequest statusRequest;
  DetailsData detailsData = DetailsData(Get.find());

  initialData() {
    ordersModel = Get.arguments['ordersModel'];

    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
          target: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!)),
          zoom: 12.4746);

      markers.add(
        Marker(
          markerId: const MarkerId("1"),
          position: LatLng(
            double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!),
          ),
        ),
      );
    }
  }

  getOrdersDetailsData() async {
    statusRequest = StatusRequest.loading;
    var response = await detailsData.getDetailsData(ordersModel.ordersId!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    initialData();
    getOrdersDetailsData();
  }
}
