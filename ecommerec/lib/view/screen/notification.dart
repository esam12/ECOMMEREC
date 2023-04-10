import 'package:dartz/dartz.dart';
import 'package:ecommerec/controller/notification_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());

    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<NotificationController>(
            builder: (controller) => HandlingData(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        const Center(
                          child: Text(
                            "Notification",
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...List.generate(
                          controller.data.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Stack(
                              children: [
                                ListTile(
                                  dense: true,
                                  title: Text(
                                      "${controller.data[index].notificationTitle}"),
                                  subtitle: Text(
                                      "${controller.data[index].notificationBody}"),
                                ),
                                Positioned(
                                  right: 5,
                                  child: Text(
                                    Jiffy(
                                            controller.data[index]
                                                .notificationDatetime,
                                            "yyyy-MM-dd")
                                        .fromNow(),
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Divider(
                                  height: 2,
                                  color: AppColor.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
