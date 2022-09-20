import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/eCommerce/ProductsView.dart';
import 'custom_text.dart';

class CategoryCard extends StatelessWidget {
  String imgUrl, title;
  double height = 6, width = 3.5;
  int id;
  CategoryCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.imgUrl,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
          () => Products(
                category: title,
                id: id,
              ),
          transition: Transition.rightToLeft),
      child: Container(
        height: MediaQuery.of(context).size.height / height,
        width: MediaQuery.of(context).size.width / width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          image: DecorationImage(
              image: NetworkImage('$imgUrl'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.darken),
              fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomText(
              text: '$title',
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
