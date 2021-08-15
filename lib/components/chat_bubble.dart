import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//text styles
TextStyle usernameTextStyle = GoogleFonts.montserrat().copyWith(
    color: Colors.black54);

TextStyle msgTextStyle=TextStyle(
  fontSize: 15.0,
  color: Colors.white,
);

//Border Radius
BorderRadius sentChatBubbleBR = BorderRadius.circular(30.0)
    .copyWith(topRight: Radius.circular(0.0));
BorderRadius receivedChatBubbleBR = BorderRadius.circular(30.0)
    .copyWith(topLeft: Radius.circular(0.0));


//Elevation
double chatBubbleElevation=5.0;

//Colors
Color chatBubbleColor=Colors.purple.shade200;

//Padding
EdgeInsets msgPadding=EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0);



class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.sender,
    required this.message, required this.isMe,
  }) : super(key: key);

  final String sender;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: usernameTextStyle,
          ),
          Material(
            borderRadius:isMe?sentChatBubbleBR:receivedChatBubbleBR,
            elevation: chatBubbleElevation,
            color: isMe?Colors.purple:Colors.purple.shade100,
            child: Padding(
              padding: msgPadding,
              child: Text(
                message,
                style: msgTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
