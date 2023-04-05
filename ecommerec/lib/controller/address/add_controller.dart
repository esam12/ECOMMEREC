import 'dart:async';
import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;

  late Completer<GoogleMapController> controllermap;

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 14.4746);
    statusRequest = StatusRequest.none;
    update();
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    lat = latLng.latitude;
    long = latLng.longitude;
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    update();
  }

  geToAddressDetails() {
    Get.toNamed(AppRoute.addressdetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  @override
  void onInit() {
    getCurrentLocation();
    controllermap = Completer<GoogleMapController>();
    super.onInit();
  }
}
