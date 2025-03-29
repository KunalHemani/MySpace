import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myspace_final/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  Future<User?> _getUserData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserData(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chat')
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (ctx, chetSnapshot) {
            if (chetSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final chetDocs = chetSnapshot.data!.docs;
            return ListView.builder(
                reverse: true,
                itemCount: chetDocs.length,
                itemBuilder: (context, index) => MessageBubble(
                  chetDocs[index]['text'],
                  chetDocs[index]['userId'] == futureSnapshot.data!.uid,
                  chetDocs[index]['username'],
                  chetDocs[index]['userImage'],
                  ValueKey(chetDocs[index].id),
                ),
            );
          },
        );
      },
    );
  }
}