import 'package:get/get.dart';

class QuantityController extends GetxController {
  RxInt quantity = 1.obs;
  RxBool addToCart = false.obs;
  RxInt selectedSize = 0.obs;
  RxInt selectedColor = 0.obs;
}
