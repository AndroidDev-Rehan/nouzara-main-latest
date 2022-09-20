import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/Authentication/MyAccount.dart';
import 'package:nzeora/Screens/Authentication/SignIn.dart';
import 'package:nzeora/Screens/eCommerce/MyOrders.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';
import '../controller/auth_controller.dart';
import '../controller/blog_controller.dart';
import '../widgets/custom_text.dart';
import 'Bookmarks.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userName = preferences.getString('email').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, top: 20, right: 32),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 3.6,
                          decoration: BoxDecoration(
                            color: AppColors.boostColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CustomText(
                                  text: '  0 ',
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                                CustomText(
                                  text: 'Orders  ',
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                                Icon(
                                  Icons.shopping_cart,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {
                          Get.to(() => const MyOrders());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                        border: Border.all(color: Colors.white),
                        color: Colors.white54),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomText(
                    text: userName,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 30),
                  ProfileEditingOptions(context, 'Signout', Icons.logout,
                      () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('email');
                    prefs.remove('token');
                    prefs.remove('isLoggedIn');

                    Get.delete<BlogController>();
                    Get.delete<AuthController>();

                    Get.to(() => const SignIn(),
                        transition: Transition.rightToLeft);
                  }),
                  ProfileEditingOptions(
                      context, 'Book marked posts', Icons.bookmark, () {
                    Get.to(() => const Bookmarks(),
                        transition: Transition.rightToLeft);
                  }),
                  const Divider(
                    color: Colors.black12,
                  ),
                  ProfileEditingOptions(context, 'Wishlist', Icons.list, null),
                  const Divider(
                    color: Colors.black12,
                  ),
                  ProfileEditingOptions(
                      context, 'My orders', Icons.shopping_cart, () {
                    Get.to(() => const MyOrders(),
                        transition: Transition.rightToLeft);
                  }),
                  const Divider(
                    color: Colors.black12,
                  ),
                  ProfileEditingOptions(
                      context, 'My Account', Icons.account_circle, () {
                    Get.to(() => const MyAccount(),
                        transition: Transition.rightToLeft);
                  }),
                ]),
          ),
        ),
      ),
    );
  }

  InkWell ProfileEditingOptions(BuildContext context, text, icon, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 11,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: '$text',
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
