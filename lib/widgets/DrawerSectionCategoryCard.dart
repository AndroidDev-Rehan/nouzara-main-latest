import 'package:flutter/material.dart';

import 'custom_text.dart';

class DrawerSectionCategoryCard extends StatelessWidget {
  String title;
  Function ontap;
  DrawerSectionCategoryCard(
      {Key? key, required this.title, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: '$title', fontSize: 21.0),
              Icon(Icons.star_border),
            ],
          ),
          new Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
