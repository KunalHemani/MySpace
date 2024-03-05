import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MySpace"),
      ),

      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("assets/images/splash.jpg"),
        //       fit: BoxFit.cover ,
        //     )
        // ),

        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 217, horizontal: 40),
                  child: Center(
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Username",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email_rounded),
                            ),
                          ),
                          SizedBox(height: 25),

                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: passToggle,
                            controller: passController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: InkWell(
                                onTap: (){
                                  setState(() {
                                    passToggle = !passToggle;
                                  });
                                },
                                child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                              ),
                            ),
                          ),

                          SizedBox(height: 50),

                          ElevatedButton(
                            onPressed: () {
                              if (emailController.text == "admin"){
                                if (passController.text == "admin"){
                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (context) => HomePage()));
                                }
                                else
                                {
                                  ScaffoldMessenger.of (context).showSnackBar (SnackBar(
                                    content: Text('Enter a valid password'),
                                  ));
                                }
                              }
                              else
                              {
                                ScaffoldMessenger.of (context).showSnackBar (SnackBar(
                                  content: Text('Enter a valid username'),
                                ));
                              }
                            },
                            child: Text('Login',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
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