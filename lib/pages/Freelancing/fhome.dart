import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myspace_final/pages/Freelancing/fdetail.dart';
import 'package:myspace_final/pages/details.dart';
import 'package:myspace_final/pages/login.dart';
// import 'package:myspace_final/pages/others/login.dart';
import 'package:myspace_final/services/database.dart';
import 'package:myspace_final/widgets/widget_support.dart';

class FHomePage extends StatefulWidget {
  const FHomePage({super.key});

  @override
  State<FHomePage> createState() => _FHomePageState();
}

class _FHomePageState extends State<FHomePage> {

  bool below_twoa = false, below_threea = false, below_foura = false;

  Stream? freelanceStream;

  ontheLoad() async {
    freelanceStream = await DatabaseMethods().getWorkspaceItem("Programmer");
    // freelanceStream = await DatabaseMethods().getWorkspaceItem("Graphics Designer");
    // freelanceStream = await DatabaseMethods().getWorkspaceItem("Translator");
    setState(() {});
  }

  @override
  void initState() {
    ontheLoad();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: freelanceStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FDetailsPage(
                          detail: ds["Detail"], name: ds["Name"], price: ds["Price"], image: ds["Image"],
                        )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 5.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ds["Image"],
                                height: 125,
                                width: 125,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 5),
                            Column(
                              children: [
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Name"],
                                    style: AppWidget.boldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Detail"],
                                    style:
                                    AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                    width:
                                    MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "\₹" + ds["Price"],
                                      style: AppWidget.boldTextFieldStyle(),
                                    ),
                                ),
                                SizedBox(height: 10,)
                              ],
                            )
                          ],
                        ),
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                SizedBox(height: 15),
                Text(
                  'Freelancer\'s Page',
                  style: AppWidget.headerTextFieldStyle(),
                ),
                SizedBox(height: 10),
                Container(
                  // margin: EdgeInsets.only(right: 10.0),
                  // child: showItem(),
                ),

                SizedBox(height: 10),

                SizedBox(height: 15),

                Container(
                    height: 600,
                    child: allItemsVertically()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            below_twoa = true;
            below_threea = false;
            below_foura = false;
            freelanceStream = await DatabaseMethods().
            getFreelanceItem("Programmer");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: below_twoa ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Programmer',
                style: TextStyle(
                    color: below_twoa ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () async {
            below_twoa = false;
            below_threea = true;
            below_foura = false;
            freelanceStream = await DatabaseMethods().
            getFreelanceItem("Graphics Designer");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: below_threea ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8.0),

              child: Text(
                'Graphics Designer',
                style: TextStyle(
                    color: below_threea ? Colors.white : Colors.black
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            below_twoa = false;
            below_threea = false;
            below_foura = true;
            freelanceStream = await DatabaseMethods().
            getFreelanceItem("Translator");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: below_foura ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8.0),
              // child: Image.asset('assets/images/btr_four.png',
              //     height: 50,
              //     width: 50,
              //     fit: BoxFit.cover,
              //     color: below_foura ? Colors.white : Colors.black),
              child: Text(
                'Translator',
                style: TextStyle(
                    color: below_foura ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
