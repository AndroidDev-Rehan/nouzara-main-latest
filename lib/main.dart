import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/splash_screen.dart';
import 'package:nzeora/controller/auth_controller.dart';
import 'package:nzeora/controller/comment_controller.dart';
import 'package:nzeora/controller/videos_controller.dart';

import 'Screens/Authentication/SignIn.dart';
import 'Screens/CommentsView.dart';
import 'Screens/example.dart';
import 'controller/UserBlogActivityController.dart';
import 'controller/blog_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_live_51H5ZluDy9E0zopB6MEVX7byPVrIU6XWlhXqvA7JGWgUDyI8oT8fb8YFcgF9Rh3LkbwDSuPQlqynJneAs25UpPJB5005hDiAnTL";


  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  AuthController authController = Get.put(AuthController());
  BlogController blogController = Get.put(BlogController());
  blogCommentsController controller = Get.put(blogCommentsController());
  VideosController videosController = Get.put(VideosController());
  UserBlogActivityController checkControl =
      Get.put(UserBlogActivityController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nzeora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen() ,
    );
  }
}
