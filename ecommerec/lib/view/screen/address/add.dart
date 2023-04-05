import 'package:ecommerec/controller/address/add_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddressAddController addressAddController = Get.put(AddressAddController());
    return Scaffold(
      appBar: AppBar(title: const Text("Add new address")),
      body: Container(
        child: GetBuilder<AddressAddController>(
          builder: ((controllerPage) => HandlingDataRequest(
                statusRequest: controllerPage.statusRequest,
                widget: Column(children: [
                  if (controllerPage.kGooglePlex != null)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          GoogleMap(
                            markers: controllerPage.markers.toSet(),
                            onTap: (latlong) {
                              controllerPage.addMarkers(latlong);
                            },
                            mapType: MapType.normal,
                            initialCameraPosition: controllerPage.kGooglePlex!,
                            onMapCreated: (GoogleMapController controller) {
                              controllerPage.controllermap.complete(controller);
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              child: MaterialButton(
                                minWidth: 150,
                                onPressed: () {
                                  addressAddController.geToAddressDetails();
                                },
                                color: AppColor.primaryColor,
                                textColor: Colors.white,
                                child: const Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ]),
              )),
        ),
      ),
    );
  }
}
