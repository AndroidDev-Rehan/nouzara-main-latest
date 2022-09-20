import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Videos.dart';
import 'eCommerce/StoreHome.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TabIndexController tabIndexController = Get.put(TabIndexController());
  RxInt _selectedindex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Row(
          children: <Widget>[
            buildBottomNavBar(
                context,
                RxInt(0),
                _selectedindex != 0 ? Icons.home_outlined : Icons.home,
                AppColors.white,
                AppColors.greyShade,
                _selectedindex == 0 ? true : false,
                'Home'),
            buildBottomNavBar(
                context,
                RxInt(1),
                _selectedindex != 1
                    ? Icons.shopping_bag_outlined
                    : Icons.shopping_bag,
                AppColors.white,
                AppColors.greyShade,
                _selectedindex == 1 ? true : false,
                'Store'),
            buildBottomNavBar(
                context,
                RxInt(2),
                _selectedindex != 2
                    ? Icons.play_circle_outline
                    : Icons.play_circle_filled_sharp,
                AppColors.white,
                AppColors.greyShade,
                _selectedindex == 2 ? true : false,
                'Videos'),
            buildBottomNavBar(
                context,
                RxInt(3),
                _selectedindex != 3
                    ? Icons.account_box_outlined
                    : Icons.account_box,
                AppColors.white,
                AppColors.greyShade,
                _selectedindex == 3 ? true : false,
                'Profile'),
          ],
        ),
      ),
      body: SafeArea(
        child: _selectedindex == 0
            ? const Home()
            : _selectedindex == 1
                ? const StoreHome()
                : _selectedindex == 2
                    ? const Videos()
                    : const Profile(),
      ),
    );
  }

  Widget buildBottomNavBar(BuildContext context, RxInt index, IconData icon,
      Color color, Color iconColor, bool isActive, String title) {
    // bool isHome=false;
    // Color colorOnHome=AppColors.white;
    // if(index==0){
    //   isHome=false;
    //   colorOnHome=AppColors.NaviBarColor;
    //
    // }
    return Obx(
      () => GestureDetector(
        onTap: () {
          setState(() {
            tabIndexController.selectedTabIndex = index;
            _selectedindex.value = tabIndexController.selectedTabIndex.value;
            // if(_selectedindex==0){
            //   color=AppColors.white;
            //   colorOnHome=AppColors.white;
            // }
            // else{
            //   color=AppColors.white;
            //   colorOnHome=AppColors.white;
            // }
            print(_selectedindex);
          });
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(color: color),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                _selectedindex == index ? icon : icon,
                color: isActive ? AppColors.black : iconColor,
              ),
              CustomText(
                text: title,
                color: isActive ? AppColors.black : iconColor,
              ),
            ],
          ), //Image.asset('assets/images/navbaricon.png'),
        ),
      ),
    );
  }
}

class TabIndexController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
}
