import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myspace_final/services/database.dart';
import 'package:myspace_final/services/shared_pref.dart';
import 'package:myspace_final/widgets/widget_support.dart';

class ViewBookings extends StatefulWidget {
  const ViewBookings({super.key});

  @override
  State<ViewBookings> createState() => _ViewBookingsState();
}

class _ViewBookingsState extends State<ViewBookings> {
  String? id, wallet, name, email;
  int total = 0,
      amount2 = 0;
  String? uid = FirebaseAuth.instance.currentUser?.uid;


  void startTimer() {
    Timer(Duration(seconds: 1), () {
      amount2 = total;
      setState(() {

      });
    });
  }

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    wallet = await SharedPreferenceHelper().getUserWallet();
    setState(() {});

    try {
      // Assuming your Firestore collection is named "users"
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('users').get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming there is only one document in the "users" collection
        // You may need to modify this depending on your data structure
        var userData = querySnapshot.docs.first.data();
        setState(() {
          name = userData['Name'];
          email = userData['Email'];

        });
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  // onthisload() async {
  //   await getthesharedpref();
  //   setState(() {});
  // }


  // getthesharedpref() async {
  //   id = await SharedPreferenceHelper().getUserId();
  //   wallet = await SharedPreferenceHelper().getUserWallet();
  //   setState(() {
  //
  //   });
  // }

  ontheload() async {
    await getthesharedpref();
    workspaceStream = await DatabaseMethods().getWorkspaceCart(id!);
    setState(() {

    });
  }

  @override
  void initState() {
    ontheload();
    startTimer();
    super.initState();
  }

  Stream? workspaceStream;

  Widget WorkspaceCart() {
    return StreamBuilder(
        stream: workspaceStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                total = total + int.parse(ds["Total"]);
                return Container(
                  margin: EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: 90,
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Text(ds["Hour"])),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.network(
                              ds["Image"],
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            children: [
                              Text(
                                name!,
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ds["Name"],
                                style: AppWidget.boldTextFieldStyle(),
                              ),
                              Text(
                                "\₹" + ds["Total"],
                                style: AppWidget.boldTextFieldStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              removeWorkspaceFromCart(id!, ds.id);
                              ontheload(); // Call your method here
                            },
                            child: Container(
                              child: Icon(Icons.delete),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                          "All Bookings",
                          style: AppWidget.headerTextFieldStyle(),
                        )))),
            SizedBox(
              height: 20.0,
            ),
            Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2,
                child: WorkspaceCart()),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Text(
                    "\₹" + total.toString(),
                    style: AppWidget.boldTextFieldStyle(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: ()
              // async
              {
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text('Your Desk is booked')));
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));



                // int amount= int.parse(wallet!)-amount2;
                // await DatabaseMethods().UpdateUserWallet(id!, amount.toString());
                // await SharedPreferenceHelper().saveUserWallet(amount.toString());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Center(
                    child: Text(
                      "Total Bookings",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void removeWorkspaceFromCart(String userId, String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection(
          'users') // Assuming 'users' is the collection where user documents are stored
          .doc(userId)
          .collection(
          'Cart') // Assuming 'Cart' is the subcollection where cart items are stored
          .doc(documentId) // Use the passed document ID
          .delete();
      print('Item removed from cart successfully');
      // After deleting, refresh the cart data
      ontheload(); // Call your method here to reload the cart data
    } catch (e) {
      print('Error removing item from cart: $e');
      // Handle error appropriately, such as showing a snackbar or dialog to the user
    }
  }
}