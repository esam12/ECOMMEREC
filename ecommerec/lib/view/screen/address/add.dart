import 'package:ecommerec/controller/address/add_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
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
      appBar: AppBar(title: Text("Add new address")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Container(
        child: GetBuilder(
          builder: ((controller) => HandlingDataRequest(
                statusRequest: addressAddController.statusRequest,
                widget: Column(children: [
                  Expanded(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: addressAddController.kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        addressAddController.controllermap.complete(controller);
                      },
                    ),
                  ),
                ]),
              )),
        ),
      ),
    );
  }
}
