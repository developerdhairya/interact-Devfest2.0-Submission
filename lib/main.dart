import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interact/Navigator.dart';
import 'package:interact/screens/add_image_screen.dart';
import 'package:interact/screens/authentication_screen.dart';
import 'package:interact/screens/chat_screen.dart';
import 'package:interact/screens/enter_username.dart';
import 'package:interact/screens/home_screen.dart';
import 'package:interact/screens/introduction_screen.dart';
import 'package:interact/screens/login.dart';
import 'package:interact/screens/otp_validation_screen.dart';
import 'package:interact/screens/profile_screen.dart';
import 'package:interact/screens/register_screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(INTERACT());
}

class INTERACT extends StatefulWidget {
  const INTERACT({Key? key}) : super(key: key);

  @override
  _INTERACTState createState() => _INTERACTState();
}

class _INTERACTState extends State<INTERACT> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple.shade300,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purple,
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/navigationGate',
      routes: {
        '/navigationGate':(context)=> NavigationGate(),
        '/introductionScreen':(context) => IntroductionScreen(),
        '/loginScreen':(context) => LoginScreen(),
        '/registerScreen':(context) => RegisterScreen(),
        '/authenticationScreen':(context)=> AuthenticationScreen(),
        '/homeScreen':(context)=> HomeScreen(),
        '/chatScreen':(context)=>ChatScreen(),
        '/profileScreen':(context)=>ProfileScreen(),
        '/addImageScreen':(context)=>AddImageScreen(),
        '/enterUsernameScreen':(context)=>EnterUsernameScreen(),
      },
    );
  }
}
