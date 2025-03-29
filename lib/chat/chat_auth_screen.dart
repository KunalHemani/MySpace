import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myspace_final/pages/login.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final auth = FirebaseAuth.instance;

  // var IsLoding = false;
  //
  // // void submitAuthForm(
  // //     String email,
  // //     String password,
  // //     String username,
  // //     File image,
  // //     bool isLogin,
  // //     ) async {
  // //   UserCredential credential;
  // //   try {
  // //     setState(() {
  // //       IsLoding = true;
  // //     });
  // //     if (isLogin) {
  // //       credential = await auth.signInWithEmailAndPassword(
  // //           email: email, password: password);
  // //     } else {
  // //       credential = await auth.createUserWithEmailAndPassword(
  // //         email: email,
  // //         password: password,
  // //       );
  // //       final ref = FirebaseStorage.instance
  // //           .ref()
  // //           .child('user_image')
  // //           .child(credential.user!.uid + '.jpg');
  // //
  // //       await ref.putFile(image);
  // //
  // //       final url = await ref.getDownloadURL();
  // //
  // //       await FirebaseFirestore.instance
  // //           .collection('users')
  // //           .doc(credential.user!.uid)
  // //           .set({
  // //         'username': username,
  // //         'email': email,
  // //         'image_url': url,
  // //       });
  // //       print(username);
  // //       print(password);
  // //       print(email);
  // //     }
  // //   } on PlatformException catch (err) {
  // //     print(err);
  // //     setState(() {
  // //       IsLoding = false;
  // //     });
  // //   } catch (error) {
  // //     print(error);
  // //   }
  // // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(
          // submitAuthForm, IsLoding
      ),
    );
  }
}