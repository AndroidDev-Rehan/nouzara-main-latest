import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nzeora/Screens/eCommerce/OrderCreated.dart';
import 'package:nzeora/models/CartItemModel.dart';
import 'package:nzeora/models/billing_model.dart';
import 'package:nzeora/models/shipping_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:woocommerce_api/woocommerce_api.dart';

import '../models/custom_web_services.dart';

class CartController extends GetxController {
  Map<int, CartItemModel> _items = {};

  Map<int, CartItemModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  addOrderedItemInCart(int productId, String title, int quantity, String image,
      String selectedColor, var price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItemModel(
                productId: productId,
                title: title,
                quantity: quantity,
                image: image,
                color: selectedColor,
                price: price,
              ));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItemModel(
          productId: productId,
          title: title,
          quantity: quantity,
          image: image,
          color: selectedColor,
          price: price,
        ),
      );
      update();
    }
  }

  Future removeItem(
    int productId,
  ) async {
    _items.remove(productId);

    update();
  }

  Map<int, BillingModel> _billingItems = {};

  Map<int, BillingModel> get billingItems {
    return {..._billingItems};
  }

  int get billingItemCount {
    return _billingItems.length;
  }

  addbillingItem(firstname, lastname, address, email, city, state, country,
      postalcode, phone) {
    if (_billingItems.containsKey(firstname)) {
      _billingItems.update(
          int.parse(phone),
          (existingCartItem) => BillingModel(
              first_name: firstname,
              lastname: lastname,
              address: address,
              email: email,
              city: city,
              state: state,
              country: country,
              postcode: postalcode,
              phone: phone));
    } else {
      _billingItems.putIfAbsent(
          int.parse(phone),
          () => BillingModel(
              first_name: firstname,
              lastname: lastname,
              address: address,
              email: email,
              city: city,
              state: state,
              country: country,
              postcode: postalcode,
              phone: int.parse(phone)));
      update();
    }
  }

  Map<int, ShippingModel> _shippingItem = {};

  Map<int, ShippingModel> get shippingItem {
    return {..._shippingItem};
  }

  int get shippingitemCount {
    return _shippingItem.length;
  }

  addShippingItem(methodId, methodtitle, total) {
    if (_shippingItem.containsKey(methodId)) {
      _shippingItem.update(
          methodId,
          (existingCartItem) => ShippingModel(
                method_id: methodId,
                method_title: methodtitle,
                total: total,
              ));
    } else {
      _shippingItem.putIfAbsent(
          methodId,
          () => ShippingModel(
                method_id: methodId,
                method_title: methodtitle,
                total: total,
              ));
      update();
    }
  }

  Future<void> submitCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lineitem;
    for (var i = 0; i < _items.length; i++) {
      lineitem = {
        "product_id": _items.values.toList()[i].productId,
        "quantity": _items.values.toList()[i].quantity,
      };
    }

    var data = {
      "payment_method": "cod",
      "payment_method_title": "Cash On Delivery",
      "set_paid": "true",
      "billing": {
        "first_name": _billingItems.values.toList().first.first_name,
        "last_name": _billingItems.values.toList().first.lastname,
        "address_1": _billingItems.values.toList().first.address,
        "address_2": _billingItems.values.toList().first.address,
        "city": _billingItems.values.toList().first.city,
        "state": _billingItems.values.toList().first.state,
        "postcode": _billingItems.values.toList().first.postcode,
        "country": _billingItems.values.toList().first.country,
        "email": _billingItems.values.toList().first.email,
        "phone": _billingItems.values.toList().first.phone.toString()
      },
      "shipping": {
        "first_name": _billingItems.values.toList().first.first_name,
        "last_name": _billingItems.values.toList().first.lastname,
        "address_1": _billingItems.values.toList().first.address,
        "address_2": _billingItems.values.toList().first.address,
        "city": _billingItems.values.toList().first.city,
        "state": _billingItems.values.toList().first.state,
        "postcode": _billingItems.values.toList().first.postcode,
        "country": _billingItems.values.toList().first.country,
      },
      "line_items": [lineitem],
      "shipping_lines": [
        {
          "method_id": "flat_rate",
          "method_title": "Flat Rate",
          "total": shippingItem.values.toList().first.total.toString()
        }
      ],
    };

    //   print(data);
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://nzeora.com/",
        consumerKey: "ck_2c1d055b514e0ae8ef7c2c021794f37687845c3c",
        consumerSecret: "cs_55d83c2d80b2f84a61d0a16d54d7e80f39bda82d");

    var products = await wooCommerceAPI.postAsync("orders", data);

    if (products["status"] == "completed") {
      _items.clear();
      Fluttertoast.showToast(msg: "Order completed Successfully");
      Get.to(() => OrderCreated());
    } else {
      Fluttertoast.showToast(msg: "Order doesnt completed");
    }
  }
}
