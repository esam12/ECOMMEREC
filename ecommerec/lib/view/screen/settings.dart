import 'package:ecommerec/controller/settings_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/constant/imageasset.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controllerImp = Get.put(SettingsControllerImp());
    return Container(
      child: ListView(
        children: [
          Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(height: Get.width / 3, color: AppColor.primaryColor),
                Positioned(
                  top: Get.width / 3.9,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: const AssetImage(AppImageAsset.avatar),
                    ),
                  ),
                ),
              ]),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      onTap: () {},
                      title: const Text("Disable Notifications"),
                      trailing: Switch(value: true, onChanged: ((value) {}))),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressView);
                    },
                    title: const Text("Address"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("About Us"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("Contact Us"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      controllerImp.logout();
                    },
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
