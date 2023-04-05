import 'package:ecommerec/controller/address/view_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(title: const Text("Address")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (context) => HandlingData(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, i) {
                return CardAddress(
                  addressmodel: controller.data[i],
                  onPressed: () {
                    controller.deleteData(controller.data[i].addressId!);
                  },
                );
              }),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressmodel;
  final void Function()? onPressed;
  const CardAddress(
      {super.key, required this.addressmodel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressmodel.addressName!),
          subtitle: Text(addressmodel.addressCity!),
          leading: const Icon(
            Icons.location_on,
            color: AppColor.primaryColor,
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
