import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nzeora/models/blog_comments.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/models/lates_blog_post.dart';
import 'package:nzeora/models/user_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import '../models/custom_web_services.dart';
import '../models/searched_blog_post.dart';

class BlogController extends GetxController {
  var blogList = <BlogsData>[].obs;
  var bookMarkPostList = <BlogsData>[].obs;

  var blogCommentsList = <BlogComments>[].obs;
  var latestBlogList = <LatestBlogPost>[].obs;
  var searchedBlogList = <BlogsData>[].obs;
  var usersData = <UserDetailModel>[].obs;
  List bookMarkList = [];

  final latestPostTimeAgo = DateTime.now().subtract(Duration(minutes: 0)).obs;

  Future<void> getBlogsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response =
        await http.get(Uri.parse(CustomWebServices.getPostsUrl), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.getString('token')}"
    });

    if (response.statusCode == 200) {
      /*Get.snackbar("posts got", "got posts Successfully!",
          backgroundColor: Color(0xff24b04b),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          borderRadius: 10,
          borderWidth: 2,
          maxWidth: 200);*/

      var responseData = response.body;
      blogList.value = blogsDataFromJson(responseData);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> getLatestBlogsData(category, checkerValue) async {
    var response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    print(prefs.getString('email'));
    print(prefs.getBool('isLoggedIn'));

    if (checkerValue == 0) {
      response = await http.get(
          Uri.parse(
              '${CustomWebServices.getrecentCategories}?page=2&per_page=10&_embed'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${prefs.getString('token')}"
          });
      print(response.body);
    } else {
      response = await http.get(
          Uri.parse('${CustomWebServices.getLatestPostUrl}$category'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${prefs.getString('token')}"
          });
    }
    print(prefs.getString('token'));
    if (response.statusCode == 200) {
      var responseData = response.body;
      latestBlogList.value = latestBlogPostFromJson(responseData);
      latestPostTimeAgo.value = DateTime.now()
          .subtract(Duration(minutes: latestBlogList[0].date!.minute));
    } else {
      print(response.statusCode);
    }
  }

  Future<void> getCategorizedBlogsData(category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.get(
        Uri.parse('${CustomWebServices.getCategoryPostUrl}$category'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${prefs.getString('token')}"
        });
    print(prefs.getString('token'));
    if (response.statusCode == 200) {
      var responseData = response.body;
      blogList.value = blogsDataFromJson(responseData);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> getSearchedBlogsData(keyWord) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.get(
        Uri.parse('${CustomWebServices.getSearchNewsUrl}$keyWord'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${prefs.getString('token')}"
        });
    print(prefs.getString('token'));
    if (response.statusCode == 200) {
      var responseData = response.body;
      blogList.value = blogsDataFromJson(responseData);
      print('loading data from search: ${blogList[0].title!.rendered}');
      print('List length: ${blogList.length}');
    } else {
      print(response.statusCode);
    }
  }

  Future<void> getBlogComments(postId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("FETCHING COMMENTS");

    var response = await http
        .get(Uri.parse('${CustomWebServices.getCommentsUrl}$postId'), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.getString('token')}"
    });
    print(response.body);
    print(prefs.getString('token'));
    if (response.statusCode == 200) {
      var responseData = response.body;
      blogCommentsList.value = blogCommentsFromJson(responseData);
      print(blogCommentsList);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> getUsersData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.post(
        Uri.parse('${CustomWebServices.baseUrlLogedin}users/me'),
        headers: {"Authorization": "Bearer ${prefs.getString('token')}"});

    if (response.statusCode == 200) {
      final decodingList = convert.jsonDecode(response.body);

      usersData.assign(UserDetailModel.fromJson(decodingList));
    } else {
      print(response.body);
    }
  }

  Future<void> addPosttoBookmark(blogId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.post(
        Uri.parse('${CustomWebServices.baseUrlLogedin}addbookmark/${blogId}'),
        headers: {"Authorization": "Bearer ${prefs.getString('token')}"});

    if (response.statusCode == 200) {
      print(response.body);
      if (response.body == "true") {
        Get.snackbar("Bookmark", "bookmark successfull",
            backgroundColor: Color(0xff24b04b),
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            borderRadius: 10,
            borderWidth: 2,
            maxWidth: 200);
      } else {
        Get.snackbar("Bookmark", "bookmark already added",
            backgroundColor: Color.fromARGB(255, 145, 35, 43),
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            borderRadius: 10,
            borderWidth: 2,
            maxWidth: 200);
      }
    } else {
      print(response.body);
    }
  }

  Future<void> getBookMarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.post(
        Uri.parse('${CustomWebServices.baseUrlLogedin}getbookmarks'),
        headers: {"Authorization": "Bearer ${prefs.getString('token')}"});

    if (response.statusCode == 200) {
      bookMarkList.assign(response.body);
    } else {
      print(response.body);
    }
  }

  Future<void> getBookMarksPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = "";

    var response = await http
        .get(Uri.parse("${CustomWebServices.baseUrlLogedin}/posts?"), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.getString('token')}"
    });

    if (response.statusCode == 200) {
      /*Get.snackbar("posts got", "got posts Successfully!",
          backgroundColor: Color(0xff24b04b),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          borderRadius: 10,
          borderWidth: 2,
          maxWidth: 200);*/

      var responseData = response.body;
      bookMarkPostList.value = blogsDataFromJson(responseData);
    } else {
      print(response.statusCode);
    }
  }
}
