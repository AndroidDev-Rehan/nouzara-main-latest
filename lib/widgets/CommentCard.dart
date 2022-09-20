import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/controller/comment_controller.dart';
import 'package:nzeora/models/blog_comments.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../Screens/CommentsView.dart';
import '../constants/colors.dart';
import 'custom_text.dart';

class CommentCard extends StatelessWidget {
  const CommentCard(
      {Key? key, required this.controller, required this.blogComments})
      : super(key: key);

  final blogCommentsController controller;
  final BlogComments blogComments;

  @override
  Widget build(BuildContext context) {
    final timeAgo =
        DateTime.now().subtract(Duration(minutes: blogComments.date!.minute));
    return Obx(
      () => Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.chipsShade2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: '${blogComments.authorName}',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: timeago.format(timeAgo),
                    color: AppColors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: '${blogComments.content!.rendered}',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.chipsShade2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.liked.value == true) {
                        controller.liked.value = false;
                      } else {
                        controller.liked.value = true;
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          controller.liked.value
                              ? Icons.thumb_up
                              : Icons.thumb_up_alt_outlined,
                          color: controller.liked.value
                              ? AppColors.mainColor
                              : AppColors.grey,
                        ),
                        CustomText(
                          text: '  Like',
                        ),
                      ],
                    ),
                  ),
                  /////
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.mode_comment_outlined,
                          color: AppColors.grey,
                        ),
                        CustomText(
                          text: '  Comment',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
