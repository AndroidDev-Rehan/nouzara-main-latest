import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/BlogReadView.dart';

import '../constants/colors.dart';
import '../models/blog_data.dart';
import 'custom_text.dart';

class BookmarkedBlogCard extends StatelessWidget {
  BlogsData blog;
  BookmarkedBlogCard({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: '${blog.title!.rendered}',
            maxLines: 3,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 20,
          ),
          Hero(
            tag: '${blog.jetpackFeaturedMediaUrl}',
            child: Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                    image: NetworkImage('${blog.jetpackFeaturedMediaUrl}'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
