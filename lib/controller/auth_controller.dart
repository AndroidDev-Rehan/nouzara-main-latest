import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nzeora/Screens/Authentication/SignIn.dart';
import 'package:nzeora/Screens/Dashboard.dart';
import 'package:nzeora/Screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/custom_web_services.dart';
import '../models/user_data.dart';

class AuthController extends GetxController {
  var isDataSubmitting = false.obs;
  var isLoginRoute = false.obs;
  var isDataReadingCompleted = false.obs;
  var isLoggedIn = false.obs;

  void loginWithDetails(String username, String password) async {
    isDataSubmitting.value = true;
    Map<String, dynamic> dataBody = {
      CustomWebServices.userName: username,
      CustomWebServices.userPassword: password
    };

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.loginUrl),
        body: dataToSend, headers: {"Content-Type": "application/json"});

    Get.back();

    if (response.statusCode == 200) {
      isDataSubmitting.value = false;
      Get.snackbar("Success", "Login Successfully!",
          backgroundColor: Color(0xff24b04b),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          borderRadius: 10,
          borderWidth: 2,
          maxWidth: 200);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print(responseData);

      var userToken = UserData.fromJson(responseData).jwtToken!;

      isDataReadingCompleted.value = true;
      isLoggedIn.value = true;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', username);
      prefs.setString('token', userToken);
      prefs.setBool('isLoggedIn', true);

      Get.to(() => Dashboard());
    } else {
      isDataSubmitting.value = false;
      Get.snackbar(
        "Sign In Failed",
        "username or password didn't match.",
        colorText: Colors.white,
        backgroundColor: Color.fromARGB(255, 150, 42, 44),
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        borderWidth: 2,
      );
      isDataSubmitting.value = false;
    }
    isLoginRoute.value = false;
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  void signUpwithDetails(String username, String email, String password) async {
    isDataSubmitting.value = true;
    Map<String, dynamic> dataBody = {
      CustomWebServices.userName: username,
      CustomWebServices.userEmail: email,
      CustomWebServices.userPassword: password
    };

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.signupUrl),
        body: dataToSend, headers: {"Content-Type": "application/json"});

    Get.back();

    if (response.statusCode == 200) {
      Get.snackbar("Success", "SignUp Successfully!",
          backgroundColor: Color(0xff24b04b),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          borderRadius: 10,
          borderWidth: 2,
          maxWidth: 200);

      Get.to(() => SignIn());
    } else {
      Get.snackbar(
        "Sign Up Failed",
        "username or email already exist.",
        colorText: Colors.white,
        backgroundColor: Color.fromARGB(255, 150, 42, 44),
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }
}
