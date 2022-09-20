import 'package:flutter/material.dart';
import 'package:nzeora/widgets/custom_text.dart';

import '../constants/colors.dart';

Widget bottomSheetStoreCategory(context){
  return DraggableScrollableSheet(
    initialChildSize: 0.95,
    builder:(_, controller) => Container(
      decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      // color: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children:  [
                InkWell(
                  child: const Icon(Icons.arrow_back_ios),
                  onTap:(){
                    Navigator.of(context).pop();
                  } ,
                ),
                SizedBox(width: MediaQuery.of(context).size.width/4.6,),
                const Text('Select Category',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Flexible(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      SizedBox(height: 40,),
                      CustomText(text: 'Pets',fontSize: 18.0,),
                      SizedBox(height: 40,),
                      CustomText(text: 'Beauty and personal care',fontSize: 18.0,),
                      SizedBox(height: 40,),
                      CustomText(text: 'Photography',fontSize: 18.0,),
                      SizedBox(height: 40,),
                      CustomText(text: 'Fashion',fontSize: 18.0,),
                      SizedBox(height: 40,),
                      CustomText(text: 'Toys',fontSize: 18.0,),
                    ],
                  ),
                ),
              )
            ),
          )
        ],
      ),
    ),
  );
}