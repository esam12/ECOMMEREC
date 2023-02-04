import 'package:ecommerec/controller/test_data_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());

    return Scaffold(
      appBar: AppBar(title: const Text("Title"),backgroundColor: AppColor.primaryColor,),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingData(
            statusRequest: controller.status_request,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                }));
      }),
    );
  }
}
