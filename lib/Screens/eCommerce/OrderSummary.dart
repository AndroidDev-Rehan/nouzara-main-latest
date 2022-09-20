import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/Dashboard.dart';

import '../../constants/colors.dart';
import '../../controller/cart_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import 'OrderCreated.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  TabIndexController tabIndexController = Get.put(TabIndexController());
  final cartController = Get.put(CartController());

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
                  title: 'Submit order',
                  onPressed: () async {
                    await cartController.submitCartItems();
                    tabIndexController.selectedTabIndex.value = 1;
                  },
                  asset: '',
                  primary: Colors.black,
                  titleColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  CustomText(
                    text: 'Order summary',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 20,
                    child: null,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: 'Shipping Address',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),
              summaryDetailCard('First name: ',
                  '${cartController.billingItems.values.toList().first.first_name}'),
              SizedBox(
                height: 20,
              ),
              summaryDetailCard('Last name: ',
                  '${cartController.billingItems.values.toList().first.lastname}'),
              SizedBox(
                height: 20,
              ),
              summaryDetailCard('Address: ',
                  '${cartController.billingItems.values.toList().first.address}'),
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: 'Order summary',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              summaryDetailCard('Subtotal: ',
                  '${cartController.shippingItem.values.toList().first.total}'),
              SizedBox(
                height: 20,
              ),
              summaryDetailCard('Delivery Fee: ', '0.0'),
              SizedBox(
                height: 20,
              ),
              summaryDetailCard('Total(Incl. tax): ',
                  '${cartController.shippingItem.values.toList().first.total}'),
            ],
          ),
        ),
      ),
    );
  }

  Wrap summaryDetailCard(heading, detail) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        CustomText(
          text: heading,
          color: AppColors.black,
          fontSize: 17.0,
        ),
        CustomText(
            text: detail,
            color: AppColors.grey,
            overflow: TextOverflow.ellipsis,
            maxLines: 2),
      ],
    );
  }
}
