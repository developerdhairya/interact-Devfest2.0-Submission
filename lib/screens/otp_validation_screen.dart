import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interact/components/sign_buttons.dart';
import 'package:interact/screens/login.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:uuid/uuid.dart';

import '../firebase.dart';

class OtpValidationScreen extends StatefulWidget {
  const OtpValidationScreen(
      {Key? key,
      required this.username,
      required this.email,
      required this.password})
      : super(key: key);

  final String username;
  final String email;
  final String password;

  @override
  _OtpValidationScreenState createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidationScreen> {
  TextEditingController _otpController = TextEditingController();
  late String otp;
  late bool _authenticUser;
  late bool _canProceed;

  void sendOtp() {
    String currOtp = Uuid().v1().substring(0, 5).toString();
    otp = currOtp;
    try {
      Mailer mailer = Mailer(
          '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');
      Address toAddress = Address(widget.email);
      Address fromAddress = Address('dhairya0192.be20@chitkara.edu.in');
      Content content = Content('text/plain',
          'Thanks for using Interact(A solution built during DevFest 2.0)..Your otp to heaven is $otp');
      String subject = 'Interact Authentication';
      Personalization personalization = Personalization([toAddress]);
      Email email =
          Email([personalization], fromAddress, subject, content: [content]);
      mailer.send(email).then((result) {
        print(result);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> registerUser() async {
    try{
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      ).then((value) {
        print(value);
        userCollection.doc(value.user!.uid).set({
          'username': widget.username,
          'email': widget.email,
          'password': widget.password,
        });
        _canProceed=true;
      });
    }catch(e){
      SnackBar snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _canProceed=false;
    }
  }

  void authenticateUser() {
    _otpController.text == otp ? _authenticUser = true : _authenticUser = false;
    if (!_authenticUser) {
      throw ("Invalid Otp");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sendOtp();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomClippedLampContainer(
                screenSize: screenSize,
                text: "OTP Validation",
              ),
              SizedBox(
                height: 60.0,
              ),
              PinCodeTextField(
                controller: _otpController,
                appContext: context,
                length: 5,
                onChanged: (value) {},
                autoDisposeControllers: false,
                animationType: AnimationType.fade,
                animationDuration: Duration(microseconds: 300),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  selectedColor: Colors.purple,
                  inactiveColor: Colors.grey.shade500,
                  activeColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              SignButton(
                  linearGradient: [Color(0xFFDA22FF), Color(0xFF9733EE)],
                  text: "Resend Otp",
                  fontSize: 12.0,
                  onPressed: () {
                    try {
                      sendOtp();
                    } catch (e) {
                      SnackBar snackBar = SnackBar(
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }),
              SizedBox(
                height: 60.0,
              ),
              SignButton(
                  linearGradient: [Color(0xFFDA22FF), Color(0xFF9733EE)],
                  text: "Validate & Next",
                  fontSize: 12.0,
                  onPressed: () async {
                    try {
                      authenticateUser();
                      if (_authenticUser) {
                        await registerUser();
                        if(_canProceed){
                          Navigator.pushNamed(context, "/addImageScreen");
                        }
                      }
                    } catch (e) {
                      SnackBar snackBar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
