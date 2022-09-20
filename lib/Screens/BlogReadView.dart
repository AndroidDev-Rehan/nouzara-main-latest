import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/widgets/custom_text.dart';

import '../controller/UserBlogActivityController.dart';
import '../controller/blog_controller.dart';
import '../models/blog_data.dart';
import '../models/blog_data.dart';
import '../widgets/MoreBlogOptionsDialog.dart';
import '../widgets/ShareDialog.dart';
import 'CommentsView.dart';

class BlogRead extends StatefulWidget {
  BlogsData blog;
  BlogRead(this.blog, {Key? key}) : super(key: key);

  @override
  State<BlogRead> createState() => _BlogReadState();
}

class _BlogReadState extends State<BlogRead> {
  UserBlogActivityController checkControl = Get.find();
  BlogController blogController = Get.find();
  var checkBookMark;

  @override
  void initState() {
    super.initState();
    blogController.getBlogComments(widget.blog.id);
    blogController.getBookMarks();
    if (blogController.bookMarkList.length > 0) {
      String checker = blogController.bookMarkList[0];

      checkBookMark = checker.contains(widget.blog.id.toString());
      checkControl.saved.value = checkBookMark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (checkControl.liked.value == true) {
                        checkControl.liked.value = false;
                      } else {
                        checkControl.liked.value = true;
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          checkControl.liked.value
                              ? Icons.thumb_up
                              : Icons.thumb_up_alt_outlined,
                          color: checkControl.liked.value
                              ? AppColors.black
                              : AppColors.grey,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        CustomText(
                          text: '15',
                          color: AppColors.grey,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (checkControl.comment.value == true) {
                        checkControl.comment.value = false;
                        Get.to(() => Comments(blog: widget.blog),
                            transition: Transition.rightToLeft);
                      } else {
                        checkControl.comment.value = true;
                        Get.to(() => Comments(blog: widget.blog),
                            transition: Transition.rightToLeft);
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          checkControl.comment.value
                              ? Icons.comment
                              : Icons.comment_outlined,
                          color: checkControl.comment.value
                              ? AppColors.black
                              : AppColors.grey,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        CustomText(
                          text: '${blogController.blogCommentsList.length}',
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (checkControl.saved.value == true) {
                        checkControl.saved.value = false;
                      } else {
                        checkControl.saved.value = true;
                      }
                      await blogController.addPosttoBookmark(widget.blog.id);
                    },
                    child: Row(
                      children: [
                        Icon(
                          checkControl.saved.value
                              ? Icons.bookmark
                              : Icons.bookmark_border_rounded,
                          color: checkControl.saved.value
                              ? AppColors.black
                              : AppColors.grey,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        CustomText(
                          text: '',
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            CustomDialogAnimated(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 40,
                            width: 40,
                            child: const Icon(Icons.share),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            CustomOptionsDialogAnimated(
                                context, widget.blog, blogController);
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 40,
                            width: 40,
                            child: const Icon(Icons.more_vert),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomText(
                  text: widget.blog.title!.rendered,
                  maxLines: 3,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: CustomText(
                          text:
                              'By ${widget.blog.embedded!.author!.elementAt(0).name}',
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: CustomText(
                          text:
                              '${widget.blog.embedded!.wpTerm!.elementAt(0).first.name}',
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.grey,
                        )),
                  ],
                ),
                CustomText(
                    text: '______',
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                    fontSize: 18.0),

                const SizedBox(
                  height: 30,
                ),
                Hero(
                  tag: '${widget.blog.jetpackFeaturedMediaUrl}',
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.blog.jetpackFeaturedMediaUrl.toString()),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //CustomText(text: '${widget.blog.content!.rendered}',color: Colors.grey,fontSize: 17.0,),
                Html(
                  data: widget.blog.content!.rendered,
                  shrinkWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
