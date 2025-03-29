import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myspace_final/services/shared_pref.dart';
import 'package:myspace_final/widgets/widget_support.dart';
import 'package:url_launcher/url_launcher.dart';

class FDetailsPage extends StatefulWidget {
  String image, name, detail, price;
  FDetailsPage({super.key,
    required this.image,
    required this.name,
    required this.detail,
    required this.price});

  @override
  State<FDetailsPage> createState() => _FDetailsPageState();
}

class _FDetailsPageState extends State<FDetailsPage> {
  int a = 1, total = 0;
  String? id;

  final Uri whatsApp = Uri.parse("https://wa.me/9428745235");

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
                  GestureDetector(
                    onTap: () {
                      launchUrl(whatsApp);
                    },
                      child: Icon(FontAwesomeIcons.whatsapp,
                      size: 30,
                      color: Colors.green,),
                  ),
                ],
              ),
              SizedBox(height: 20.0),

              Text(widget.detail,
                style: AppWidget.lightTextFieldStyle(),
                maxLines: 4,
              ),
              Spacer(),

              Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Container(
                        width: MediaQuery.of(context).size.width/6,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8)
                            ),
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri(
                                    scheme: 'tel',
                                    path: "7383920612",
                                  );
                                  if(await canLaunchUrl(url)){
                                    await launchUrl(url);
                                  }
                                  else {
                                    print("Cannot launch");
                                  }
                                },
                                child: Icon(
                                  Icons.call,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}