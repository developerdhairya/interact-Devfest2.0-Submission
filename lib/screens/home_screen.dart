
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interact/screens/chat_screen.dart';
import 'package:interact/screens/profile_screen.dart';
import 'package:interact/screens/video_conferencing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _bottomNavList = [
    VideoConferencingScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onNavItemTap(value){
    setState(() {
      _selectedIndex=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_sharp),
            label: "Make Virtual Meet",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat_rounded,),label: "Chat with Me"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page),label: "Who Am I ?"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavItemTap,
        selectedItemColor: Colors.purple.shade400,
      ),
    );
  }
}
