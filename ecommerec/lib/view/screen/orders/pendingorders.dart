import 'package:ecommerec/controller/orders/pendingorders_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/view/widget/orders/orderslistcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<PendingOrdersController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: ((context, index) =>
                  CardOrders(orderModel: controller.data[index])),
            ),
          ),
        ),
      ),
    );
  }
}
