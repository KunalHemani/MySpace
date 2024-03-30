import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myspace_final/pages/order.dart';
import 'package:myspace_final/services/database.dart';
import 'package:myspace_final/services/shared_pref.dart';
import 'package:myspace_final/widgets/widget_support.dart';

class Details extends StatefulWidget {
  String image, name, detail, price;
  Details({super.key,
    required this.image,
    required this.name,
    required this.detail,
    required this.price});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1, total = 0;
  String? id;

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {

    });
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    ontheload();
    total = int.parse(widget.price);
  }

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
              Image.network( widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name, style: AppWidget.boldTextFieldStyle()),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (a > 1) {
                        --a;
                        total = total - int.parse(widget.price);
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
                      if (a < 10) {
                        ++a;
                        total = total + int.parse(widget.price);
                      };
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
              Text(widget.detail,
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
              Center(
                child: Text(
                  'Your total booking time : ' + a.toString() + ' Hour(s)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
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
                          '\₹' + total.toString(),
                          style: AppWidget.headerTextFieldStyle(),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 75,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Order()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/7,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              CupertinoIcons.bag_fill,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 5,),

                    GestureDetector(
                      onTap: () async {
                        Map<String, dynamic> addWorkspacetoCart = {
                          "Name": widget.name,
                          "Hour": a.toString(),
                          "Total": total.toString(),
                          "Image": widget.image
                        };
                      await DatabaseMethods().addWorkspaceItemtoCart(
                      addWorkspacetoCart, id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          'Desk added to Cart.',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      );
                    },
                      child: Container(
                        width: MediaQuery.of(context).size.width/7,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              CupertinoIcons.shopping_cart,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
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
