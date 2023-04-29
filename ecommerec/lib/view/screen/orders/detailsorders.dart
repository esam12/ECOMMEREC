import 'package:ecommerec/controller/orders/ordersdetails_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsOrders extends StatelessWidget {
  const DetailsOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<OrdersDetailController>(
              builder: (controller) => HandlingData(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    const TableRow(
                                      children: [
                                        Text(
                                          "Item",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColor.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "QTY",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColor.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Price",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColor.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    ...List.generate(
                                      controller.data.length,
                                      (index) => TableRow(
                                        children: [
                                          Text(
                                              "${controller.data[index].itemsName}",
                                              textAlign: TextAlign.center),
                                          Text(
                                              "${controller.data[index].itemsCat}",
                                              textAlign: TextAlign.center),
                                          Text(
                                              "${controller.data[index].itemsprice} \$",
                                              textAlign: TextAlign.center),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.all(7),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    "Price : ${controller.ordersModel.ordersTotalprice}\$",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        color: AppColor.secondColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (controller.ordersModel.ordersType == "0")
                          Card(
                            child: Container(
                              child: ListTile(
                                title: const Text(
                                  "Shipping Address",
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    "${controller.ordersModel.addressCity} , ${controller.ordersModel.addressStreet} "),
                              ),
                            ),
                          ),
                        if (controller.ordersModel.ordersType == "0")
                          Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              height: 400,
                              width: double.infinity,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                markers: controller.markers.toSet(),
                                initialCameraPosition:
                                    controller.cameraPosition!,
                                onMapCreated:
                                    (GoogleMapController controllermanp) {},
                              ),
                            ),
                          )
                      ],
                    ),
                  ))),
    );
  }
}
