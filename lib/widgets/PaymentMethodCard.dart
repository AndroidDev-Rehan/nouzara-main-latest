import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text.dart';

class PaymentMethodCard extends StatelessWidget {
  String methodTitle;
  bool selected=false;
  var asset;
  dynamic onTap;
  PaymentMethodCard({
    Key? key, required this.methodTitle,required this.asset,required this.selected, this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                selected?Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:Border.all(color: selected?AppColors.black:Colors.black,width: 3,),
                  ),
                    child: const Icon(Icons.circle,size: 20,),
                ):Container(),
                const SizedBox(width: 10,),
                CustomText(text: methodTitle,fontWeight: FontWeight.w600,fontSize: 15.0,overflow: TextOverflow.ellipsis,),
              ],
            ),
            Image.asset(asset,height: 30,),
          ],
        ),
      ),
    );
  }
}