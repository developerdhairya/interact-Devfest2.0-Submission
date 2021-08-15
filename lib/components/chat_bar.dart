import 'package:flutter/material.dart';

class ChatBar extends StatelessWidget {
  const ChatBar({Key? key, required this.controller, required this.onSend})
      : super(key: key);

  final controller;
  final onSend;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: ()async{
            await onSend();
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
