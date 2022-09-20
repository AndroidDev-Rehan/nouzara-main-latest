import 'package:get/get.dart';
import 'package:nzeora/models/category_model.dart';
import 'package:nzeora/models/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class CategoryController extends GetxController {
  var categoryList = <CategoryModel>[].obs;
  var productList = <ProductsModel>[].obs;
  var loader = false;

  loadingProgress() {
    loader = false;
  }

  getCategoryList() async {
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://nzeora.com/",
        consumerKey: "ck_2c1d055b514e0ae8ef7c2c021794f37687845c3c",
        consumerSecret: "cs_55d83c2d80b2f84a61d0a16d54d7e80f39bda82d");

    var products = await wooCommerceAPI.getAsync("products/categories");
    final List<dynamic> responseData = products;
   

    categoryList.assignAll(
        responseData.map((obj) => CategoryModel.fromJson(obj)).toList());
  }

  getProductByCategory(categoryId) async {
    loader = true;
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://nzeora.com/",
        consumerKey: "ck_2c1d055b514e0ae8ef7c2c021794f37687845c3c",
        consumerSecret: "cs_55d83c2d80b2f84a61d0a16d54d7e80f39bda82d");

    var products =
        await wooCommerceAPI.getAsync("products?category=${categoryId}");

    final List<dynamic> responseData = products;

    productList.assignAll(
        responseData.map((obj) => ProductsModel.fromJson(obj)).toList());
    loader = false;
    update();
  }
}
