import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/eCommerce/CartView.dart';
import 'package:nzeora/controller/cart_controller.dart';
import 'package:nzeora/controller/category_controller.dart';
import 'package:nzeora/widgets/ProductCard.dart';
import 'package:nzeora/widgets/custom_text.dart';

import '../../models/product_data.dart';

class Products extends StatefulWidget {
  String category;
  int id;
  Products({Key? key, required this.category, required this.id})
      : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final categoryController = Get.put(CategoryController());
  final cartController = Get.put(CartController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    categoryController.getProductByCategory(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 25, top: 25, left: 25),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  CustomText(
                    text: widget.category,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(cartController.items);
                      cartController.itemCount == 0
                          ? null
                          : Get.to(() => CartView(),
                              transition: Transition.rightToLeft);
                    },
                    child: SizedBox(
                      width: 20,
                      child: Stack(children: <Widget>[
                        GetBuilder<CartController>(
                            init: CartController(),
                            builder: (context) {
                              return cartController.itemCount == 0
                                  ? Icon(Icons.shopping_cart)
                                  : Badge(
                                      position: BadgePosition.topEnd(
                                          top: -6, end: -14),
                                      shape: BadgeShape.circle,
                                      child: Icon(Icons.shopping_cart),
                                      badgeContent: Text(
                                        cartController.itemCount.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ));
                            }),
                      ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GetBuilder<CategoryController>(
                  init: CategoryController(),
                  builder: (value) {
                    return categoryController.loader == true
                        ? Column(
                            children: [
                              SizedBox(
                                height: 200,
                              ),
                              Center(child: CircularProgressIndicator()),
                            ],
                          )
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                  product:
                                      categoryController.productList[index]);
                            },
                            itemCount: categoryController.productList.length,
                          );
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
