import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  UpdateUserWallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({"wallet" : amount});
  }
  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async{
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }
}