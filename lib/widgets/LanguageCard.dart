import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  String language="",country="";
   LanguageCard({
    Key? key,
    required this.language,required this.country
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(language, style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
              const SizedBox(height: 10,),
              Text(country,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
              SizedBox(height: 30,)
            ]),
      ),
    );
  }
}


