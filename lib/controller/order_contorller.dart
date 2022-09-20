import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nzeora/models/order_model.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class OrderContorller extends GetxController {
  var orderList = <OrderModel>[].obs;

  getOrderList() async {
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://nzeora.com/",
        consumerKey: "ck_2c1d055b514e0ae8ef7c2c021794f37687845c3c",
        consumerSecret: "cs_55d83c2d80b2f84a61d0a16d54d7e80f39bda82d");

    var products = await wooCommerceAPI.getAsync("orders");
    final List<dynamic> responseData = products;

    orderList.assignAll(
        responseData.map((obj) => OrderModel.fromJson(obj)).toList());
  }
}
