import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interact/components/chat_bubble.dart';

import '../firebase.dart';

class ChatStream extends StatefulWidget {
  const ChatStream({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final String currentUser;

  @override
  _ChatStreamState createState() => _ChatStreamState();
}

class _ChatStreamState extends State<ChatStream> {
  Stream<QuerySnapshot<Object?>> msgStream =
      messageCollection.orderBy('Time', descending: false).snapshots();

  Text errorText = Text('Something went wrong');

  Color senderBubbleColor = Colors.purple.shade200;
  Color receiverBubbleColor = Colors.purple.shade50;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: msgStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return errorText;
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              reverse: true,
              children: snapshot.data!.docs.reversed.map((e) {
                bool isMe = widget.currentUser == e['User'];
                return ChatBubble(
                  sender: e['User'],
                  message: e['Message'],
                  isMe: isMe,
                );
              }).toList());
        });
  }
}
