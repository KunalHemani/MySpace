// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:myspace_final/pages/bottom_nav.dart';
// import 'package:myspace_final/pages/home.dart';
// import 'package:myspace_final/pages/signup.dart';
//
// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot){
//           // user is logged in
//           if(snapshot.hasData) {
//             return Home();
//           }
//           // user is not logged in
//           else {
//             return SignUp();
//           }
//         },
//       ),
//     );
//   }
// }