import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myspace_final/pages/Freelancing/fhome.dart';
import 'package:myspace_final/pages/home.dart';
import 'package:myspace_final/pages/login.dart';
// import 'package:myspace_final/pages/others/login.dart';

class ShowCategoryPage extends StatefulWidget {
  ShowCategoryPage({super.key});

  @override
  State<ShowCategoryPage> createState() => _ShowCategoryPageState();
}

class _ShowCategoryPageState extends State<ShowCategoryPage> {
  // File ? _selectedImage;

  // late String searchString;
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => Login()));
            },
            child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 25),
            Text(
              'Select your Preference',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),

            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => Home()));
                      },
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('assets/images/maindesk.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                }),

            SizedBox(height: 15),

            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => FHomePage()));
                      },
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('assets/images/freelancing.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}