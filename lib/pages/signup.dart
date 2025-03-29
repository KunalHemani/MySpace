import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:myspace_final/pages/home.dart";
import "package:myspace_final/pages/bottom_nav.dart";
import "package:myspace_final/pages/login.dart";
// import "package:myspace_final/pages/others/login.dart";
// import "package:myspace_final/pages/others/show_category.dart";
import "package:myspace_final/pages/show_category.dart";
import "package:myspace_final/services/database.dart";
import "package:myspace_final/services/shared_pref.dart";
import "package:myspace_final/widgets/widget_support.dart";
import "package:random_string/random_string.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                'Registered Successfully.',
                style: TextStyle(fontSize: 20),
              )),
        );

        String Id = randomAlphaNumeric(10);
        Map<String, dynamic> addUserInfo = {
          "Name" : nameController.text,
          "Email" : emailController.text,
          "wallet" : "0",
          "Id" : Id,
        };
        await DatabaseMethods().addUserDetails(addUserInfo, Id);
        await SharedPreferenceHelper().saveUserName(nameController.text);
        await SharedPreferenceHelper().saveUserEmail(emailController.text);
        await SharedPreferenceHelper().saveUserWallet('0');
        await SharedPreferenceHelper().saveUserId(Id);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNav()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey,
            content: Text(
              'Password provided is too weak.',
              style: TextStyle(fontSize: 20),
            ),
          ));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.grey,
              content: Text(
                'Account already exists',
                style: TextStyle(fontSize: 20),
              )));
        }
      }
    }
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
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                     Colors.black,
                        Colors.black,
                    ])),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                //child: Text('hii'),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset("assets/images/logo.jpg",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 30.0),

                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()){
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                            name = nameController.text;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                          });
                        }
                        registration();
                      },
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 1.75,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Form(
                              key: _formKey,

                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  Text(
                                    'Sign up',
                                    style: AppWidget.headerTextFieldStyle(),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: nameController,
                                    validator: (value) {
                                      if(value == null || value.isEmpty ){
                                        return "Please Enter Name.";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Name',
                                        hintStyle: AppWidget.boldTextFieldStyle(),
                                        prefixIcon: Icon(Icons.person)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if(value == null || value.isEmpty ){
                                        return "Please Enter E-mail.";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: AppWidget.boldTextFieldStyle(),
                                        prefixIcon: Icon(Icons.email_outlined)),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: passwordController,
                                    validator: (value) {
                                    if(value == null || value.isEmpty ){
                                        return "Please Enter Password.";
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: AppWidget.boldTextFieldStyle(),
                                        prefixIcon: Icon(Icons.lock)),
                                  ),

                                  SizedBox(
                                    height: 40,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                                        setState(() {
                                          email = emailController.text;
                                          name = nameController.text;
                                          password = passwordController.text;
                                        });
                                      }
                                      registration();
                                    },
                                    child: Material(
                                      elevation: 10.0,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(25)),
                                        child: Center(
                                          child: Text(
                                            'SIGN UP',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Already have an account?",
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                        ),

                        SizedBox(width: 10,),

                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Login()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ))
                      ],
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
