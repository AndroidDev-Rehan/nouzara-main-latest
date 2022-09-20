import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:nzeora/models/comment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/custom_web_services.dart';

class blogCommentsController extends GetxController {
  RxBool commented = false.obs, liked = false.obs;
  RxString txtController = ''.obs;

  Future<void> addComment(postId, authorId, commentText) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var url =
        "${CustomWebServices.baseUrlLogedin}comments?post=$postId&author=$authorId&content=$commentText";

    var response = await http.post(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.getString('token')}"
    });
    Get.back();

    print(response.body);

    if (response.statusCode == 201) {
      Get.snackbar("Success", "Comment Added",
          backgroundColor: Color(0xff24b04b),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          borderRadius: 10,
          borderWidth: 2,
          maxWidth: 200);
    } else {
      Get.snackbar(
        "Failed",
        "Comment not added",
        colorText: Colors.white,
        backgroundColor: Color.fromARGB(255, 150, 42, 44),
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }
}
