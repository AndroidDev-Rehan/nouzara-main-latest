import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/controller/cart_controller.dart';
import 'package:nzeora/models/product_data.dart';
import 'package:nzeora/models/products_model.dart';

import '../../widgets/CartProductCard.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import 'CheckOutView.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final cartController = Get.put(CartController());
  var totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    var convertToList = cartController.items.values.toList();

    for (var i = 0; i < cartController.items.length; i++) {
      setState(() {
        totalAmount += convertToList[i].price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height / 3.5,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 80.0, top: 20, left: 80, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Subtotal(\$)',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  CustomText(
                    text: totalAmount.toString(),
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Delivery fee',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  CustomText(
                    text: '00.0',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Total(incl. Tax)',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  CustomText(
                    text: totalAmount.toString(),
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomButton(
                  title: 'Checkout',
                  onPressed: () {
                    Get.to(() => CheckOut(price: totalAmount),
                        transition: Transition.rightToLeft);
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
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  const CustomText(
                    text: 'Cart',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    width: 20,
                    child: null,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: GetBuilder<CartController>(
                    init: cartController,
                    builder: (context) {
                      return ListView.builder(
                          itemCount: cartController.items.length,
                          itemBuilder: (context, index) {
                            var categorizeList =
                                cartController.items.values.toList();

                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Get.to(ProductDetails(product: product, callType: 'MyOrders'),transition: Transition.rightToLeft);
                                  },
                                  child: Container(
                                    color: AppColors.chipsShade2,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: Hero(
                                            tag: categorizeList[index]
                                                .image
                                                .toString(),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  7,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${categorizeList[index].image}'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                  text: categorizeList[index]
                                                      .title,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                // Wrap(
                                                //   children: [
                                                //     CustomText(
                                                //         text: product.,
                                                //         color: AppColors.grey,
                                                //         overflow: TextOverflow.ellipsis,
                                                //         maxLines: 2),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 15,
                                                // ),
                                                // CustomText(
                                                //   text: '\$${product.}',
                                                //   fontWeight: FontWeight.bold,
                                                //   fontSize: 18.0,
                                                //   overflow: TextOverflow.ellipsis,
                                                // ),

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CustomText(
                                                      text:
                                                          'Price: ${categorizeList[index].price}',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15.0,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          'Qty: ${categorizeList[index].quantity}',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15.0,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Container(
                                                      child: null,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            );
                          });
                    }),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3),
            ],
          ),
        ),
      ),
    );
  }
}
