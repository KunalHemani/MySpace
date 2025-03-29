import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:myspace_final/services/database.dart';
import 'package:myspace_final/services/shared_pref.dart';
import 'package:myspace_final/widgets/app_constant.dart';
import 'package:myspace_final/widgets/widget_support.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet, id;
  int? add;
  String? total;
  TextEditingController amountcontroller = new TextEditingController();

  getthesharedpref() async {
    wallet = await SharedPreferenceHelper().getUserWallet();
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  // Fetch user wallet balance on screen load
  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    wallet = ''; // Initialize wallet balance
    ontheload();
    super.initState();
  }

  // getthesharedpref() async {
  //   wallet = await SharedPreferenceHelper().getUserWallet();
  //   id = await SharedPreferenceHelper().getUserId();
  //   setState(() {});
  // }
  //
  // ontheload() async {
  //   await getthesharedpref();
  //   setState(() {});
  // }
  //
  //
  // @override
  // void initState() {
  //   wallet = ''; // or wallet = '0';
  //   ontheload();
  //   super.initState();
  // }


  // @override
  // void initState() {
  //   ontheload();
  //   super.initState();
  // }

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    var wallet;
    return Scaffold(
      body:
      // wallet == null ? CircularProgressIndicator()  :
      Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Wallet",
                      style: AppWidget.headerTextFieldStyle(),
                    ),
                    ),
                ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/wallet.jpeg",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallet",
                        style: AppWidget.lightTextFieldStyle(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        // total,
                        // "\₹$wallet",
                        // "\₹" + wallet!,
                        "\₹ 100",
                        style: AppWidget.boldTextFieldStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Add money",
                style: AppWidget.lightTextFieldStyle(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    makePayment('100', context);
                    // total = total + 100;
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\₹" + "100",
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makePayment('500', context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\₹" + "500",
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makePayment('1000', context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\₹" + "1000",
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makePayment('2000', context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\₹" + "2000",
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                openEdit();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFF008080),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Add Money",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  // Future<void> makePayment(String amount, BuildContext context) async {
  //   try {
  //     // Your existing code for creating payment intent
  //
  //     // Simulate a successful payment
  //     // In a real application, you would handle the actual payment process here
  //     // For demonstration purposes, we're simply adding ₹100 to the wallet
  //     addMoneyToWallet('100');
  //
  //     // Show a success message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Payment successful. ₹100 added to wallet.'),
  //       ),
  //     );
  //
  //     // Clear payment intent and update UI
  //     paymentIntent = null;
  //     setState(() {});
  //   } catch (e, s) {
  //     print('exception:$e$s');
  //     // Handle any errors
  //   }
  // }


  Future<void> makePayment(String amount, BuildContext context) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+91',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "INR", merchantCountryCode: "+91"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Adnan'
              ),)
          .then((value) {
        // displayPaymentSheet(amount, context);

      });

      ///now finally display payment sheeet
      displayPaymentSheet(amount, context);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(String amount, BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        add = int.parse(wallet!) + int.parse(amount);
        await SharedPreferenceHelper().saveUserWallet(add.toString());
        await DatabaseMethods().UpdateUserWallet(id!, add.toString());
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Payment Successfull"),
                        ],
                      ),
                    ],
                  ),
                )
        );
        await getthesharedpref();
        // ignore: use_build_context_synchronously

        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
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
          'Authorization': 'Bearer $secretKey',
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
    final calculatedAmout = (int.parse(amount)) * 100;

    return calculatedAmout.toString();
  }

  Future openEdit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);},
                            child: Icon(Icons.cancel)),
                        SizedBox(width: 60.0,),
                        Center(child: Text(
                            "Add Money",style: TextStyle(
                              color: Color(0xFF008080),
                              fontWeight: FontWeight.bold,),),)
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Amount"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: amountcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Enter Amount'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.pop(context);
                          paymentIntent = await createPaymentIntent(amountcontroller.text, 'INR');
                          //Payment Sheet
                          await Stripe.instance
                              .initPaymentSheet(
                              paymentSheetParameters: SetupPaymentSheetParameters(
                                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+91',),
                                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "INR", merchantCountryCode: "+91"),
                                  style: ThemeMode.dark,
                                  merchantDisplayName: 'Adnan'))
                              .then((value) {
                                print('Hii');
                            displayPaymentSheet(amountcontroller.text, context);

                          });
                          makePayment(amountcontroller.text, context);
                        },
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFF008080),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Pay",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      ),
  );

  // Future<void> addMoneyToWallet(String amount) async {
  //   try {
  //     // Update the wallet balance locally
  //     wallet = (int.parse(wallet ?? '0') + int.parse(amount)).toString();
  //     // Update the wallet balance in Shared Preferences
  //     await SharedPreferenceHelper().saveUserWallet(wallet!);
  //     // Update the wallet balance in Firestore or your backend database
  //     await DatabaseMethods().UpdateUserWallet(id!, wallet!);
  //     // Update the state to reflect the changes
  //     setState(() {});
  //   } catch (e) {
  //     // Handle any errors
  //     print('Error adding money to wallet: $e');
  //   }
  // }


}