import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:myspace_final/chat/chat_screen.dart';
import 'package:myspace_final/chat/chat_auth_screen.dart';
import 'package:myspace_final/pages/onboard.dart';
// import 'package:myspace_final/pages/others/onboard.dart';
import 'package:myspace_final/widgets/app_constant.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Stream<User?> _authStream() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.authStateChanges();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home:
      Onboard(),
      // StreamBuilder(
      //   stream: _authStream(),
      //   builder: (context, UserSnapshot) {
      //     if (UserSnapshot.hasData) {
      //       return ChatScreen();
      //     }
      //     return AuthScreen();
      //   },
      // ),
    );
  }
}