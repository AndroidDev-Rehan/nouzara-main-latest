import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/controller/order_contorller.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/models/product_data.dart';
import 'package:nzeora/widgets/BookmarkedBlogCard.dart';
import 'package:nzeora/widgets/CartProductCard.dart';
import 'package:nzeora/widgets/custom_button.dart';

import '../../widgets/custom_text.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  var orderController = Get.put(OrderContorller());
  @override
  void initState() {
    // TODO: implement initState
    orderController.getOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                      text: 'My orders',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      width: 20,
                      child: null,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: orderController.orderList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          trailing: ElevatedButton(
                            child: Text(
                                '${orderController.orderList[index].status}'),
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                orderController.orderList[index].status ==
                                        "processing"
                                    ? Colors.blue
                                    : orderController.orderList[index].status ==
                                            "completed"
                                        ? Colors.green
                                        : Colors.red,
                              ),
                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.purple,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(orderController.orderList[index].id
                                  .toString()),
                            ),
                          ),
                          title: Text(
                            '${orderController.orderList[index].dateCreated.toString().substring(0, 11)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              'Total Price. ${orderController.orderList[index].total}'),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
