import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/widgets/BookmarkedBlogCard.dart';

import '../controller/blog_controller.dart';
import '../widgets/custom_text.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  BlogController blogController = Get.find();

  @override
  void initState() {
    super.initState();
    blogController.getBlogsData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0,left: 30,right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: ()=>Get.back(),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  const CustomText(text: 'Bookmarked posts',fontSize: 20.0,fontWeight: FontWeight.w600,),
                  SizedBox(width: 20,child: Icon(Icons.bookmark,color: AppColors.mainColor,),),
                ],
              ),
              const SizedBox(height: 20,),

              /////////ListView here
              Obx(
                ()=> ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:(context,index){
                    return BookmarkedBlogCard(blog: blogController.blogList[index]);
                  },
                  itemCount: blogController.blogList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

