import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

Widget BuildChip(String label,isActive) {
  RxBool isActiveChip=isActive.obs;
  Color txtColor=Colors.black54;
  Color chipColor=AppColors.chipsShade;
  return Obx(
    ()=> GestureDetector(
      onTap: (){
        if(isActiveChip==true){
          txtColor=Colors.white;
          chipColor=Colors.black;
        }
        else{
          txtColor=Colors.black54;
          chipColor=AppColors.chipsShade;
        }
      },
      child: Chip(
        labelPadding: EdgeInsets.all(2.0),
        avatar: CircleAvatar(
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        deleteButtonTooltipMessage: label,
        label: Text(
          '  $label',
          style: TextStyle(
            color: isActiveChip==true ?txtColor:txtColor,
          ),
        ),
        backgroundColor: isActiveChip==true ?chipColor:chipColor,
        elevation: 6.0,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.all(8.0),
      ),
    ),
  );
}

