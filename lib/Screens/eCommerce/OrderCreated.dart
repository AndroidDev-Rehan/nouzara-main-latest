import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../Dashboard.dart';

class OrderCreated extends StatefulWidget {
  const OrderCreated({Key? key}) : super(key: key);

  @override
  State<OrderCreated> createState() => _OrderCreatedState();
}

class _OrderCreatedState extends State<OrderCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 7,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 30.0, top: 0, left: 30, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomButton(
                  title: 'Go Home',
                  onPressed: () {
                    Get.offAll(() => Dashboard(),
                        transition: Transition.leftToRight);
                  },
                  asset: '',
                  primary: Colors.black,
                  titleColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              CustomText(
                  text: '  Order created',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
