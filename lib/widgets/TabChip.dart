import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/Home.dart';
import '../constants/colors.dart';

class TabChip extends StatelessWidget {
  TabChip({
    Key? key,
  //  required this.indexControl,
    required this.text,
    required this.indexIs,
  }) : super(key: key);

  //categoriesTabController indexControl;
  var indexControl = Get.put(categoriesTabController());

  var text;
  var indexIs;


  @override
  Widget build(BuildContext context) {
    print(indexIs);
    return Obx(
      ()=> Container(
        decoration: BoxDecoration(
          color: indexControl.selectedIndex.value==indexIs?AppColors.black:AppColors.chipsShade,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0,left: 10.0),
            child: Text("$text"),
          ),
        ),
      ),
    );
  }
}