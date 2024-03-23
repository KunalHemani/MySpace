import 'package:flutter/material.dart';
import 'package:myspace_final/pages/login.dart';
import 'package:myspace_final/pages/signup.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

  // initially show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Login(
          // onTap: togglePages
      );
    }
    else {
      return SignUp(
          // onTap: togglePages
      );
    }
  }
}
