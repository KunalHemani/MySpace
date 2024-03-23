import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myspace_final/admin%20pages/admin_login.dart';
import 'package:myspace_final/pages/bottom_nav.dart';
import 'package:myspace_final/pages/forgotpassword.dart';
import 'package:myspace_final/pages/home.dart';
import 'package:myspace_final/pages/signup.dart';
import 'package:myspace_final/widgets/widget_support.dart';

class Login extends StatefulWidget {
  // final Function()? onTap;
  const Login({super.key,
    // required this.onTap
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email = "", password = "";

  final _formkey = GlobalKey<FormState> ();

  TextEditingController useremailControoler =  new TextEditingController();
  TextEditingController userpasswordControoler =  new TextEditingController();

  userLogin() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,  password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
    } on FirebaseAuthException catch (e){

      showErrorMessage(e.code);

      // if(e.code == 'user-not-found'){
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     backgroundColor: Colors.grey,
      //     content: Text(
      //       'No user found for that email.',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ));
      // } else if(e.code == 'wrong-password'){
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     backgroundColor: Colors.grey,
      //     content: Text(
      //       'Wrong Password.',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ));
      // }
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black,
                        Colors.black,
                  ])
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                //child: Text('hii'),
              ),
              Container(
                margin: EdgeInsets.only(top: 60 , left: 20 , right: 20),
                child: Column(
                  children: [
                    Center(
                        child: Image.asset("assets/images/mylogo.jpg",
                          height: 155, width: MediaQuery.of(context).size.width/1.15, fit: BoxFit.cover,)
                    ),
                    SizedBox(height: 30.0),

                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left:20 , right: 20),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),

                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                SizedBox(height: 30),
                                Text('Login', style: AppWidget.headerTextFieldStyle(),),
                                SizedBox(height: 30,),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: useremailControoler,

                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return 'Please Enter Email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: AppWidget.boldTextFieldStyle(),
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: userpasswordControoler,
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },

                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: AppWidget.boldTextFieldStyle(),
                                      prefixIcon: Icon(Icons.lock),
                                  ),
                                ),

                                SizedBox(height: 11,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=> ForgotPassword()));
                                  },
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text("Forgot Password?",
                                    style: AppWidget.boldTextFieldStyle(),),
                                  ),
                                ),
                                SizedBox(height: 50,),
                                GestureDetector(
                                  onTap: (){
                                    if(_formkey.currentState!.validate()){
                                      setState(() {
                                        email = useremailControoler.text;
                                        password = userpasswordControoler.text;
                                      });
                                      // print(email);
                                      // print("Hi");
                                      // print(password);
                                      }
                                    userLogin();
                                  },
                                  child: Material(
                                    elevation: 5.0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      width: 150,
                                      decoration: BoxDecoration(color: Colors.black,
                                      borderRadius: BorderRadius.circular(25)),
                                      child: Center(
                                          child: Text('LOGIN', style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        ),
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 40,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                          style: TextStyle(
                            fontSize: 17
                          ),
                        ),

                        SizedBox(width: 10),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> SignUp()));
                          },
                          child: Text("Sign up",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 70),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> AdminLogin()));
                      },
                      child: Text("Login as Admin",
                        style: AppWidget.boldTextFieldStyle(),
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
