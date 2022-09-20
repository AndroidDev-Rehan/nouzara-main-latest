import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/controller/comment_controller.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/widgets/custom_button.dart';
import 'package:nzeora/widgets/custom_text.dart';

import '../controller/blog_controller.dart';
import '../models/lates_blog_post.dart';
import '../widgets/CommentCard.dart';
import '../widgets/custom_text_field.dart';
import 'CommentsView.dart';

class LatestBlogComments extends StatefulWidget {
  LatestBlogPost blog;
  LatestBlogComments({Key? key, required this.blog}) : super(key: key);

  @override
  State<LatestBlogComments> createState() => _LatestBlogCommentsState();
}

class _LatestBlogCommentsState extends State<LatestBlogComments> {
  blogCommentsController controller = Get.put(blogCommentsController());
  TextEditingController commentController = TextEditingController();

  BlogController blogController = Get.find();

  @override
  void initState() {
    super.initState();
    //blogController.getBlogComments(widget.blog.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: NetworkImage(
                          '${widget.blog.jetpackFeaturedMediaUrl}'),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width / 3.2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      //width: MediaQuery.of(context).size.width/1.8,
                      child: CustomText(
                        text: '${widget.blog.title!.rendered}',
                        maxLines: 3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: 'Comments(${blogController.blogCommentsList.length})',
                  fontWeight: FontWeight.w700,
                  fontSize: 25.0,
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: blogController.blogCommentsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CommentCard(
                          controller: controller,
                          blogComments: blogController.blogCommentsList[index]),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 200),
                        offset: Offset(1, 1),
                        blurRadius: 10,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'Nnenna Nweke (You)',
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            maxLines: 1,
                            hintText: 'Add a POSTER',
                            controller: commentController,
                            onChanged: (context) {
                              controller.txtController.value =
                                  commentController.text;
                              print(commentController.text);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            title: 'poster',
                            asset: '',
                            onPressed: () {},
                            titleColor: controller.txtController.value == ''
                                ? Colors.black
                                : Colors.white,
                            primary: controller.txtController.value == ''
                                ? Colors.white
                                : Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*class blogCommentsController extends GetxController{
  RxBool commented=false.obs,liked=false.obs;
  RxString txtController=''.obs;
}*/
