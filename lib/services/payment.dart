// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
//
//
//
// class Payment {
//
//   Map<String, dynamic>? paymentIntentData;
//   Future<void> makePayment(String amount) async {
//     final url = Uri.parse(
//         "https://us-central1-befriend-me-e07b6.cloudfunctions.net/firstApi/stripePayement");
//     final response =
//     await http.post(url, body: {'amount': amount,'stripe_secret':'sk_test_51I9cjpBmB1AZ3VVDtL37cbzzWkf8XqK71dSaBt9ZbO379Ot2FWUmFrx1tn4J43I3W1objrs0aE6vzYDRTlN5gMCy00fTgKMyYY'});
//     paymentIntentData = json.decode(response.body);
//     await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret: paymentIntentData!['client_secret'],
//             applePay: true,
//             googlePay: true,
//             style: ThemeMode.dark,
//             merchantCountryCode: 'Us',
//             merchantDisplayName: 'Befriend'));
//     await displayPaymentSheet();
//   }
//
//   Future<void> displayPaymentSheet() async {
//     try{
//       await Stripe.instance.presentPaymentSheet(
//
//           parameters: PresentPaymentSheetParameters(
//             clientSecret: paymentIntentData!['client_secret'],
//             confirmPayment: true,
//           ));
//       // EventController _eventcontroller = Get.put(EventController());
//       // FirebaseFirestore.instance.collection('Events').doc(_eventcontroller.selectedevent.uid).set({'stlist':FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])},SetOptions(merge: true));
//       paymentIntentData=null;
//     }
//     on StripeException catch (e) {
//       debugPrint("error occurs");
//       debugPrint(e.error.type);
//       debugPrint(e.error.message);
//       debugPrint(e.error.code.toString());
//
//       rethrow;
//       // Get.snackbar("Error", e.error.message.toString());
//
//     }
//   }
// }
