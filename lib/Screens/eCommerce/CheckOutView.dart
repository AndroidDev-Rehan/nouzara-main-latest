import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../controller/cart_controller.dart';
import '../../widgets/PaymentMethodCard.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import 'OrderSummary.dart';

class CheckOut extends StatefulWidget {
  var price;
  CheckOut({required this.price});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  RxInt selectedMethod = 0.obs;
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final phonenumber = TextEditingController();
  final country = TextEditingController();
  final state = TextEditingController();
  final postalcode = TextEditingController();
  final city = TextEditingController();
  final address = TextEditingController();

  final controller = Get.put(CartController());
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 2.8,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 30.0, top: 20, left: 30, bottom: 30),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // PaymentMethodCard(methodTitle: 'Credit/Debit Card',asset: 'assets/images/creditcardicon.png',selected: selectedMethod.value==0?true:false,onTap: (){selectedMethod.value=0;DebitCreditCardDialog(context);},),
                // PaymentMethodCard(methodTitle: 'Crypto',asset: 'assets/images/btc_logo.png',selected: selectedMethod.value==1?true:false,onTap: (){selectedMethod.value=1;CryptoPaymentDialog(context);}),
                // PaymentMethodCard(methodTitle: 'Ideal',asset: 'assets/images/ideal.png',selected: selectedMethod.value==2?true:false,onTap: (){selectedMethod.value=2;IdealPaymentDialog(context);}),
                // PaymentMethodCard(
                //     methodTitle: 'PayPal',
                //     asset: 'assets/images/paypal.png',
                //     selected: selectedMethod.value == 0 ? true : false,
                //     onTap: () {
                //       selectedMethod.value = 0;
                //     }),
                PaymentMethodCard(
                    methodTitle: 'Cash on Delivery',
                    asset: 'assets/images/paypal.png',
                    selected: selectedMethod.value == 0 ? true : false,
                    onTap: () {
                      selectedMethod.value = 0;
                    }),
                PaymentMethodCard(
                    methodTitle: 'Debit/Credit Card',
                    asset: 'assets/images/paypal.png',
                    selected: selectedMethod.value == 1 ? true : false,
                    onTap: () {
                      selectedMethod.value = 1;
                    }),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomButton(
                    title: 'Continue',
                    onPressed: () async {
                      bool result = true;
                      if(selectedMethod.value == 1){
                        result = false;
                        result = await makePayment();
                      }
                      if (result){
                        await controller.addbillingItem(
                            firstname.text,
                            lastname.text,
                            address.text,
                            email.text,
                            city.text,
                            state.text,
                            country.text,
                            postalcode.text,
                            phonenumber.text);
                        await controller.addShippingItem(
                            12, "Flat Rate", widget.price);
                        Get.to(() => const OrderSummary(),
                            transition: Transition.rightToLeft);
                      }
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
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                    text: 'Check out',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    width: 20,
                    child: null,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'First Name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: firstname,
                hintText: 'Type your name...',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: 'Last Name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: lastname,
                hintText: 'Type your name...',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: email,
                hintText: 'Type your email...',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: 'Phone Number',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: phonenumber,
                hintText: 'Type your phone number...',
              ),
              const CustomText(
                text: 'Country ',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: country,
                hintText: 'Type your country...',
              ),
              const CustomText(
                text: 'State ',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: state,
                hintText: 'Type your state...',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: 'Postal code ',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: postalcode,
                hintText: 'Type your Postal code...',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: 'City',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: city,
                hintText: 'Type your City name...',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: 'Add a shipping address',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: address,
                hintText: 'Add an address...',
                maxLines: 3,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _purchase() async {
  //   try{
  //
  //     final paymentMethod = await Stripe.instance.createPaymentMethod( const PaymentMethodParams.card(paymentMethodData: PaymentMethodData()));
  //
  //     // await Payment().makePayment("9.99");
  //     // await prefs.setBool("premium", true);
  //     // premium = true;
  //
  //     // await PaymentController.makePayment(amount: "10", currency: "USD");
  //
  //     // Navigator.pop(context);
  //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  //     //   return MyNewHomeScreen();
  //     // }));
  //
  //   }
  //   on StripeException catch(e){
  //     if(e.error.code == FailureCode.Canceled){
  //       print("payment cancelled");
  //     }
  //   }
  //   // final bool available = await InAppPurchase.instance.isAvailable();
  //   // if (!available) {
  //   //   print("Not Available");
  //   //   // The store cannot be reached or accessed. Update the UI accordingly.
  //   // } else {
  //   //   print("AVAILABLE");
  //   // }
  //
  //   // print("starting");
  //   // await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters());
  //   // await Stripe.instance.presentPaymentSheet();
  //   // log("done");
  //
  //
  //   // final PaymentMethod paymentMethod = await Stripe.instance.createPaymentMethod(PaymentMethodParams.card(paymentMethodData: PaymentMethodData()));
  //
  // }

  Future<bool> makePayment() async {
    try {

      String price = (widget.price as double).toInt().toString();
      print(price);

      paymentIntent = await createPaymentIntent(price, 'USD');
      //Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
              // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
              style: ThemeMode.dark,
              merchantDisplayName: 'Adnan')).then((value){
      });


      ///now finally display payment sheeet
      bool success = await displayPaymentSheet();
      return success;
    } catch (e, s) {
      print('exception:$e$s');
      return false;
    }
  }

  Future<bool> displayPaymentSheet() async {

    try {

      bool success = true;

      await Stripe.instance.presentPaymentSheet(
      ).then((value){
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green,),
                      Text("Payment Successfull"),
                    ],
                  ),
                ],
              ),
            ));
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntent = null;

      }).onError((error, stackTrace){
        success = false;
        print('Error is:--->$error $stackTrace');
      });

      return success;

    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
      return false;
    } catch (e) {
      print('$e');
      return false;
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer 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',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100 ;
    return calculatedAmout.toString();
  }

}
