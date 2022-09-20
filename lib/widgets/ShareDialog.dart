import 'package:flutter/material.dart';

Future<dynamic> CustomDialogAnimated(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      SizedBox(height: 20,),
                      Text("Share", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 20,),
                      Text('Share on your social media pages',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/facebook.png',height: 40),
                            Image.asset('assets/images/insta.png',height:40),
                            Image.asset('assets/images/twitter.png',height: 50,),
                          ],),
                      ),

                      SizedBox(height: 20,),
                      InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.w600),)),
                      SizedBox(height: 20,),
                    ]),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {return Container();});
}