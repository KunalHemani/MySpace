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

  // Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async{
  //   return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  // }

  Future addWorkspaceItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance
        .collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getWorkspaceItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addWorkspaceItemtoCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id).collection("Cart")
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getWorkspaceCart(String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).collection("Cart").snapshots();
  }


  // Freelance Page
  Future addFreelanceItem(Map<String, dynamic> userInfoMap, String name) async{
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFreelanceItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addFreelanceItemtoCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id).collection("Cart")
        .add(userInfoMap);
  }



  Future<Stream<QuerySnapshot>> getFreelanceCart(String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).collection("Cart").snapshots();
  }


  // Future<void> removeWorkspaceFromCart(String id, String documentId) async {
  // try {
  // await FirebaseFirestore.instance
  //     .collection('users') // Assuming 'users' is the collection where user documents are stored
  //     .doc(id)
  //     .collection('Cart') // Assuming 'cart' is the subcollection where cart items are stored
  //     .doc(documentId)
  //     .delete();
  // print('Item removed from cart successfully');
  // } catch (e) {
  // print('Error removing item from cart: $e');
  // // Handle error appropriately, such as showing a snackbar or dialog to the user
  // }
  // }
}