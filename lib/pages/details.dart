import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myspace_final/pages/order.dart';
import 'package:myspace_final/widgets/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/Desk_and_chair_image_of_office.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 15),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Desk on rent', style: AppWidget.boldTextFieldStyle()),
                      Text('Desk', style: AppWidget.headerTextFieldStyle()),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (a > 1) {
                        --a;
                      }

                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    a.toString(),
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      ++a;

                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'In a desk-on-rent setup, tenants typically pay a fee for access to a desk or workstation within a shared office space. This fee may cover utilities, internet access.',
                style: AppWidget.lightTextFieldStyle(),
                maxLines: 4,
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    'Min. Booking Time',
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.alarm,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '1 Hour',
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\₹ 299',
                          style: AppWidget.headerTextFieldStyle(),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/7,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> Order()));
                                },
                                child: Icon(
                                  CupertinoIcons.shopping_cart,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                                                                                                                                                                                                                                                                SizedBox(
                                                                                                                                                                                                                                                                  width: 10.0,
                                                                                                                                                                                                                                                                ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
