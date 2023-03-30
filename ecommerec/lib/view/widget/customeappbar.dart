import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedSearch;
  final void Function()? onPressedFavorite;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomAppBar({
    super.key,
    required this.titleappbar,
    this.onPressedSearch,
    required this.onPressedFavorite,
    required this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            controller: mycontroller,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: onPressedSearch,
                ),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[200]),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // Container(
        //   decoration: BoxDecoration(
        //       color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        //   width: 60,
        //   padding: const EdgeInsets.symmetric(vertical: 8),
        //   child: IconButton(
        //     onPressed: onPressedNotify,
        //     icon: Icon(
        //       Icons.notifications_on_outlined,
        //       size: 30,
        //       color: Colors.grey[600],
        //     ),
        //   ),
        // ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
            onPressed: onPressedFavorite,
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 30,
              color: Colors.grey[600],
            ),
          ),
        ),
      ]),
    );
  }
}
