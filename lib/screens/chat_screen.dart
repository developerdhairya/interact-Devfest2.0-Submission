import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interact/components/chat_bar.dart';
import 'package:interact/firebase.dart';
import 'package:interact/sawo.dart';
import 'package:interact/streams/chat_stream.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();

  String username="";

  SnackBar _snackBar = SnackBar(
    content: Text("Message Can't be Empty"),
    backgroundColor: Colors.deepPurple,
  );

  Future<void> sendMessage() async {
    try {
      String message = _messageController.text;
      message != ""
          ? await messageCollection.add({
              'User': username,
              'Message': message,
              'Time': DateTime.now(),
            })
          : ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      _messageController.clear();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserDetails() async {
    late DocumentSnapshot userDocMap;
    if(!sawoEnabled){
    userDocMap = await userDocument.get();
    }else{
    userDocMap = await sawoUserDocument.get();

    }
    setState(() {
      username = userDocMap['username'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.deepPurple.shade50,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: ChatStream(currentUser: username),
            ),
            ChatBar(controller: _messageController, onSend: sendMessage)
          ],
        ),
      ),
    );
  }
}
