import 'package:ecommerec/controller/address/addressdetails_controller.dart';
import 'package:ecommerec/core/shared/custombutton.dart';
import 'package:ecommerec/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressDetailsController controller = Get.put(AddressDetailsController());
    return Scaffold(
      appBar: AppBar(title: const Text("Add Details for address")),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomTextFormAuth(
                hinttext: "name",
                labeltext: "Name",
                iconData: Icons.location_on,
                mycontroller: controller.name,
                valid: (val) {},
                type: TextInputType.name),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormAuth(
                hinttext: "city",
                labeltext: "City",
                iconData: Icons.location_city,
                mycontroller: controller.city,
                valid: (val) {},
                type: TextInputType.name),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormAuth(
                hinttext: "street",
                labeltext: "Street",
                iconData: Icons.streetview_outlined,
                mycontroller: controller.street,
                valid: (val) {},
                type: TextInputType.name),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              text: "Add",
              onPressed: () {
                controller.addaddress();
              },
            )
          ],
        ),
      ),
    );
  }
}
