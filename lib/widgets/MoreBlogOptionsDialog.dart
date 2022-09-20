import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/models/lates_blog_post.dart';
import 'package:nzeora/widgets/custom_text.dart';

Future<dynamic> CustomOptionsDialogAnimated(
    BuildContext context, var blog, controller) {
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutSine.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "More",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  await controller.addPosttoBookmark(blog.id);
                                },
                                child: const CustomText(
                                  text: 'Add post to bookmark',
                                  fontSize: 18.0,
                                )),
                            new Divider(
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: 'Add post to Favourite',
                              fontSize: 18.0,
                            ),
                            new Divider(
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: 'Save in news reading history',
                              fontSize: 18.0,
                            ),
                            new Divider(
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 20,
                      ),
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
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}
