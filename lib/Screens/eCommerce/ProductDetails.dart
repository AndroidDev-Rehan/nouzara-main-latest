import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:nzeora/Screens/eCommerce/CartView.dart';
import 'package:nzeora/controller/cart_controller.dart';
import 'package:nzeora/controller/quantity_controller.dart';
import 'package:nzeora/models/product_data.dart';
import 'package:nzeora/models/products_model.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';

class ProductDetails extends StatefulWidget {
  ProductsModel product;
  String callType;
  ProductDetails({Key? key, required this.product, required this.callType})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final controller = Get.put(QuantityController());
  final cartController = Get.put(CartController());
  String selectColor = "";

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.callType == 'MyOrders'
          ? null
          : Container(
              color: Colors.white,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        print(widget.product.price);
                        await cartController.addOrderedItemInCart(
                            widget.product.id!,
                            widget.product.name!,
                            controller.quantity.value,
                            widget.product.images!.first.src!,
                            selectColor,
                            (double.parse(widget.product.price!.isEmpty ? "10" :  widget.product.price!) *
                                (controller.quantity.value)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart_outlined,
                                color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: 'Add to cart',
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     print("HERE");
                    //     Get.to(() => CartView(product: widget.product),
                    //         transition: Transition.rightToLeft);
                    //   },
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width / 3,
                    //     height: MediaQuery.of(context).size.height / 18,
                    //     decoration: BoxDecoration(
                    //         color: AppColors.black,
                    //         borderRadius: BorderRadius.all(Radius.circular(8))),
                    //     child: Padding(
                    //       padding:
                    //           const EdgeInsets.only(left: 10.0, right: 10.0),
                    //       child: Center(
                    //           child: CustomText(
                    //         text: 'Buy now',
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //       )),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 30, left: 30),
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
                    text: 'Details',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
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
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Hero(
                  tag: '${widget.product.images!.first.src}',
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.65,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.product.images!.first.src.toString()),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 1.85,
                  child: Container(
                    //height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      //image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/842811/pexels-photo-842811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: CustomText(
                                    text: '${widget.product.name}',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              CustomText(
                                  text: '\$${widget.product.price}',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                        text: 'Description',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: _parseHtmlString(
                          '${widget.product.shortDescription}'),
                      color: AppColors.grey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    widget.product.attributes!.length != 0
                        ? Row(
                            children: [
                              const CustomText(
                                  text: 'Colors:',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                              const SizedBox(
                                width: 10,
                              ),
                              widget.product.attributes!.length != 0
                                  ? Container(
                                      height: 40,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: widget.product
                                              .attributes![1].options!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ProductColor(
                                                  widget.product.attributes![1]
                                                      .options![index]
                                                      .replaceAll('#', '0xff'),
                                                  index,
                                                  controller.selectedColor ==
                                                          index
                                                      ? true
                                                      : false),
                                            );
                                          }),
                                    )
                                  : SizedBox()
                            ],
                          )
                        : SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    widget.product.attributes!.length != 0
                        ? Row(
                            children: [
                              const CustomText(
                                  text: 'Sizes:',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                              const SizedBox(
                                width: 10,
                              ),
                              widget.product.attributes!.length != 0
                                  ? Container(
                                      height: 60,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: widget.product.attributes!
                                              .first.options!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ProductSize(
                                                  widget.product.attributes!
                                                      .first.options![index],
                                                  index,
                                                  controller.selectedSize ==
                                                          index
                                                      ? true
                                                      : false),
                                            );
                                          }),
                                    )
                                  : SizedBox()
                            ],
                          )
                        : SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CustomText(
                            text: 'Quantity:',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                        SizedBox(
                          width: 10,
                        ),
                        QuantityButton(AppColors.chipsShade, '-', () {
                          if (controller.quantity.value > 1) {
                            setState(() {
                              controller.quantity.value--;
                            });

                            print(controller.quantity.value);
                          }
                        }),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(
                            text: '${controller.quantity}',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                        SizedBox(
                          width: 10,
                        ),
                        QuantityButton(AppColors.black, '+', () {
                          setState(() {
                            controller.quantity.value++;
                          });
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell QuantityButton(color, txtIcon, onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: CustomText(
            text: txtIcon,
            color: txtIcon == '+' ? Colors.white : Colors.black,
          )),
        ),
      ),
    );
  }

  InkWell ProductSize(size, index, selected) {
    return InkWell(
      onTap: () {
        setState(() {
          controller.selectedSize.value = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: selected ? AppColors.black : AppColors.chipsShade,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: CustomText(
            text: size,
            color: selected ? Colors.white : Colors.black,
          )),
        ),
      ),
    );
  }

  InkWell ProductColor(String color, index, selected) {
    return InkWell(
      onTap: () {
        setState(() {
          controller.selectedColor.value = index;
          selectColor = color;
        });
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Color(int.parse(color)),
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? AppColors.mainColor : Color(int.parse(color)),
            width: 3,
          ),
        ),
      ),
    );
  }
}
