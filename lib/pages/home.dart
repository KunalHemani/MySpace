import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myspace_final/pages/details.dart';
import 'package:myspace_final/services/database.dart';
import 'package:myspace_final/widgets/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool below_twoa = false, below_threea = false, below_foura = false;

  Stream? workspaceStream;

  ontheLoad() async {
    // workspaceStream = await DatabaseMethods().
  }
   @override


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50.0, left: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('NAMASTE!!  🙏',
                    style: AppWidget.boldTextFieldStyle(),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: Icon(CupertinoIcons.cart_fill,),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Text('MySpace',
                style: AppWidget.headerTextFieldStyle(),
                ),
                SizedBox(height: 25),
                Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: showItem(),
                ),
                SizedBox(height: 35),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> Details()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: Material(
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/images/Desk_and_chair_image_of_office.jpg',
                                  height: 150, width: 150, fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 5),
                                  Text('Desk on rent', style: AppWidget.boldTextFieldStyle(),),
                                  SizedBox(height: 5),
                                  Text('Desk', style: AppWidget.semiBoldTextFieldStyle(),),
                                  SizedBox(height: 5),
                                  Text('\₹ 199', style: AppWidget.boldTextFieldStyle(),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 15),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/Desk_and_chair_image_of_office.jpg',
                                  height: 150, width: 150, fit: BoxFit.cover,
                                ),
                                SizedBox(height: 5),
                                Text('Chair on rent', style: AppWidget.boldTextFieldStyle(),),
                                SizedBox(height: 5),
                                Text('Chair', style: AppWidget.semiBoldTextFieldStyle(),),
                                SizedBox(height: 5),
                                Text('\₹ 299', style: AppWidget.boldTextFieldStyle(),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
                            Image.asset('assets/images/Desk_and_chair_image_of_office.jpg',
                              height: 150, width: 150, fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text('Table on rent',
                                  style: AppWidget.boldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text('Table',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text('\₹ 499',
                                    style: AppWidget.boldTextFieldStyle(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            below_twoa = true;
            below_threea = false;
            below_foura = false;

            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: below_twoa?Colors.black: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/btr_two.png',
                height: 50, width: 50, fit: BoxFit.cover,
                color: below_twoa? Colors.white: Colors.black
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            below_twoa = false;
            below_threea = true;
            below_foura = false;

            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: below_threea?Colors.black: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/btr_three.png',
                height: 50, width: 50, fit: BoxFit.cover,
                color: below_threea? Colors.white: Colors.black
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            below_twoa = false;
            below_threea = false;
            below_foura = true;

            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: below_foura?Colors.black: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/btr_four.png',
                height: 50, width: 50, fit: BoxFit.cover,
                color: below_foura? Colors.white: Colors.black
              ),
            ),
          ),
        ),

      ],
    );
  }
}
