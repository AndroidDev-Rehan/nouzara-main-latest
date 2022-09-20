import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/controller/comment_controller.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/widgets/custom_button.dart';
import 'package:nzeora/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/blog_controller.dart';
import '../widgets/CommentCard.dart';
import '../widgets/custom_text_field.dart';
import 'package:html/parser.dart';

class Comments extends StatefulWidget {
  BlogsData blog;
  Comments({Key? key, required this.blog}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  blogCommentsController controller = Get.put(blogCommentsController());

  TextEditingController commentController = TextEditingController();

  BlogController blogController = Get.put(BlogController());
  late SharedPreferences pref;
  String userName = "";

  @override
  void initState() {
    super.initState();
    getUserName();

    blogController.getBlogComments(widget.blog.id);
  }

  getUserName() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      userName = pref.getString('email')!;
    });
  }

  //here goes the function
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
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
                      child: ListTile(
                        leading: Image.network(
                            "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png"),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: blogController
                                  .blogCommentsList[index].authorName
                                  .toString(),
                              maxLines: 3,
                              fontWeight: FontWeight.w700,
                            ),
                            Text(_parseHtmlString(blogController
                                .blogCommentsList[index].content!.rendered
                                .toString())),
                          ],
                        ),
                      ),
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
                          CustomText(
                            text: '${userName} (You)',
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            maxLines: 1,
                            hintText: 'Add a comment',
                            controller: commentController,
                            onChanged: (context) {
                              controller.txtController.value =
                                  commentController.text;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            title: 'POST',
                            asset: '',
                            onPressed: () async {
                              await controller.addComment(
                                  widget.blog.id,
                                  blogController.usersData.first.id,
                                  commentController.text.trim());
                              await blogController
                                  .getBlogComments(widget.blog.id);
                            },
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
