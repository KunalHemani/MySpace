import 'package:flutter/material.dart';
import 'package:myspace_final/admin%20pages/add_freelancers.dart';
import 'package:myspace_final/admin%20pages/add_workspace.dart';
import 'package:myspace_final/admin%20pages/admin_login.dart';
import 'package:myspace_final/admin%20pages/view_bookings.dart';
import 'package:myspace_final/admin%20pages/view_desk.dart';
import 'package:myspace_final/admin%20pages/view_freelance.dart';
import 'package:myspace_final/widgets/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                ),
              ),
            ),
            // SizedBox(height: 25,),
            Center(child: Text("Home Admin", style: AppWidget.headerTextFieldStyle(),),),
            SizedBox(height: 25.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Addworkspace()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(2.0),
                          child: Image.asset("assets/images/logo.jpg", height: 100, width: 100, fit: BoxFit.cover,),
                        ),
                      SizedBox(width: 25.0,) ,
                      Text(
                        "Add WorkSpace",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            // fontWeight: FontWeight.bold
                        ),
                      ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> AddFreelancing()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(4.0),
                          child: Image.asset(
                            "assets/images/logo.jpg",
                            height: 100, width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 25.0,) ,
                        Text(
                          "Add Freelancing",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> ViewDesk()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(4.0),
                          child: Image.asset("assets/images/logo.jpg", height: 100, width: 100, fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 25.0,) ,
                        Text(
                          "View WorkSpace",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewFreelance()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(4.0),
                          child: Image.asset(
                            "assets/images/logo.jpg",
                            height: 100, width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 25.0,) ,
                        Text(
                          "View Freelancing",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              // fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewBookings()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Image.asset(
                            "assets/images/logo.jpg",
                            height: 100, width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 25.0,),
                        Text(
                          "Bookings",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
}