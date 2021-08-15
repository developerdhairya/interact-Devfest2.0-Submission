import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interact/screens/home_screen.dart';
import 'package:interact/screens/introduction_screen.dart';

class NavigationGate extends StatefulWidget {
  const NavigationGate({Key? key}) : super(key: key);

  @override
  _NavigationGateState createState() => _NavigationGateState();
}

class _NavigationGateState extends State<NavigationGate> {
  bool isSigned=false;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if(event!=null){
        setState(() {
          isSigned=true;
        }
        );
      }else{
        setState(() {
          isSigned=false;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSigned ? HomeScreen():IntroductionScreen(),
    );
  }
}
