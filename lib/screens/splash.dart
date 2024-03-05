import 'package:flutter/material.dart';
import 'package:myspace/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override


  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(seconds: 3), (){});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logof.png"),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         height: 100, width: 100, color: Colors.blueAccent,
      //       ),
      //       Container(
      //         child: Text("Splash Screen",
      //           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}