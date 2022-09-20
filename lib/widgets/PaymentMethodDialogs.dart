import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';

import 'custom_button.dart';
import 'custom_text.dart';
import 'custom_text_field.dart';

Future<dynamic> DebitCreditCardDialog(BuildContext context) {
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutSine.transform(a1.value) -   1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      SizedBox(height: 20,),
                      GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.close),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Pay with card", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                          Image.asset('assets/images/creditcardicon.png',height: 25,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      CustomText(text: 'Pay \$160',fontSize: 20.0,color: AppColors.mainColor,),
                      //////////////
                      SizedBox(height: 20,),
                      CustomTextField(hintText: 'Card number',borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
                      //////////////
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //////////////
                          SizedBox(
                            width: 125,
                              child: CustomTextField(hintText: 'MM/YY',borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,)),
                          //////////////
                          SizedBox(width: 10,),
                          SizedBox(
                            width: 125,
                              child: CustomTextField(hintText: 'CVV',borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,)),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CustomButton(title: 'Proceed', onPressed: (){
                          Get.back();
                        },asset: '',primary: Colors.black,titleColor: Colors.white,),
                      ),
                      SizedBox(height: 20,),
                    ]
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 250),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {return Container();});
}

////////////////////////////////

Future<dynamic> CryptoPaymentDialog(BuildContext context) {
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutSine.transform(a1.value) -   1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      SizedBox(height: 20,),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Pay with crypto", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                          Image.asset('assets/images/btc_logo.png',height: 25,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      CustomText(text: 'Pay \$160',fontSize: 20.0,color: AppColors.mainColor,),
                      //////////////
                      SizedBox(height: 20,),
                      CustomText(text: 'Select Crypto currency',fontWeight: FontWeight.bold,),
                      SizedBox(height: 10,),
                      CustomTextField(hintText: 'e.g. Bitcoin',borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
                      //////////////
                      SizedBox(height: 20,),
                      CustomText(text: 'Wallet address',fontWeight: FontWeight.bold,),
                      SizedBox(height: 10,),
                      CustomTextField(hintText: '6wbe76276et27dtb726etb72',borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
                      //////////////

                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CustomButton(title: 'Proceed', onPressed: (){
                          Get.back();
                        },asset: '',primary: Colors.black,titleColor: Colors.white,),
                      ),
                      SizedBox(height: 20,),
                      CustomText(text: 'or scan the QR code below to make payment'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network('https://api.qr-code-generator.com/v1/create?access-token=EBephxedmZHs9OWzR2Kbv-125ifulLI1LemyW4NO2hwWifAzpHadEVcOq-OkFtNz&qr_code_pattern=rounded-2&frame_name=no-frame&frame_color=%23000000&foreground_color=%23000000&background_color=%23FFFFFF&qr_code_logo=&marker_left_template=version1&marker_right_template=version1&marker_bottom_template=version1&qr_code_text=https%3A%2F%2Fwww.nzeora.com%2F&frame_text=Scan%20me&frame_icon_name=mobile&image_format=PNG&image_width=300&download=1',height: 80,),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ]
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 250),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {return Container();});
}

////////////////////////////////////////

Future<dynamic> IdealPaymentDialog(BuildContext context) {
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutSine.transform(a1.value) -   1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      SizedBox(height: 20,),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Pay with Ideal", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                          Image.asset('assets/images/ideal.png',height: 25,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      CustomText(text: 'Pay \$160',fontSize: 20.0,color: AppColors.mainColor,),
                      //////////////
                      SizedBox(height: 20,),
                      CustomText(text: 'Bank',fontWeight: FontWeight.bold,),
                      SizedBox(height: 10,),
                      CustomTextField(hintText: 'Type bank...',borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
                      //////////////
                      //////////////
                      SizedBox(height: 20,),
                      CustomText(text: 'Name',fontWeight: FontWeight.bold,),
                      SizedBox(height: 10,),
                      CustomTextField(hintText: 'Type Name...',borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
                      //////////////

                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CustomButton(title: 'Pay \$160.00', onPressed: (){
                          Get.back();
                        },asset: '',primary: Colors.black,titleColor: Colors.white,),
                      ),
                      SizedBox(height: 20,),
                    ]
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 250),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {return Container();});
}