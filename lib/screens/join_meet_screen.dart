import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:interact/components/sign_buttons.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:shake/shake.dart';

import '';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class JoinMeetScreen extends StatefulWidget {
  const JoinMeetScreen({Key? key}) : super(key: key);

  @override
  _JoinMeetScreenState createState() => _JoinMeetScreenState();
}

class _JoinMeetScreenState extends State<JoinMeetScreen> {
//Paddings
  EdgeInsets _pagePadding = EdgeInsets.symmetric(
    horizontal: 16.0,
  );

//TextStyles
  TextStyle _headerTextStyle = GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

//Input Decorations
  InputDecoration _userFieldInputDecoration = InputDecoration(
    border: OutlineInputBorder(),
    labelText: "Name  (Optional)",
    labelStyle: GoogleFonts.damion(),
    prefixIcon: Icon(Icons.face),
  );

//String
  String _headerText = "ROOM CODE";

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _roomController = TextEditingController();
  bool _isAudioMuted = false;
  bool _isVideoMuted = false;
  bool _isJoined=false;
  int _shakeFrequency=0;

  void _joinMeeting() async {
    try {
      Map<FeatureFlagEnum, bool> featureflags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };
      if (Platform.isAndroid) {
        featureflags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureflags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      var options = JitsiMeetingOptions(room: _roomController.text)
        ..featureFlags.addAll(featureflags)
        ..videoMuted = _isVideoMuted
        ..userDisplayName = _usernameController.text
        ..audioMuted = _isAudioMuted;
      
      await JitsiMeet.joinMeeting(options);
      _isJoined=true;
      ShakeDetector detector = ShakeDetector.autoStart(
          onPhoneShake: () async{
            if(_isJoined && _shakeFrequency==6){
              await JitsiMeet.closeMeeting();
              _isJoined=false;
              _shakeFrequency=0;
            }else{
              _shakeFrequency+=1;
            }
          }
      );
      if(!_isJoined){
        detector.stopListening();
      }
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _pagePadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24.0,
            ),
            Text(
              _headerText,
              style: _headerTextStyle,
            ),
            PinCodeTextField(
              controller: _roomController,
              appContext: context,
              length: 6,
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
              height: 40.0,
            ),
            TextField(
              decoration: _userFieldInputDecoration,
              controller: _usernameController,
            ),
            SizedBox(
              height: 60.0,
            ),
            CheckboxListTile(
              title: Text(
                "Audio Muted",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
              value: _isAudioMuted,
              onChanged: (value) {
                setState(() {
                  _isAudioMuted = value!;
                });
              },
            ),
            SizedBox(
              height: 6.0,
            ),
            CheckboxListTile(
              title: Text(
                "Video Muted",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
              value: _isVideoMuted,
              onChanged: (value) {
                setState(() {
                  _isVideoMuted = value!;
                });
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Kudos! You can customize your settings in the meeting.",
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 38.0,
              thickness: 2.0,
            ),
            SizedBox(height: 32.0),
            SignButton(
              linearGradient: [
                Color.fromRGBO(143, 158, 241, 1),
                Color.fromRGBO(143, 148, 241, .6),
              ],
              text: "Join Meeting",
              fontSize: 20.0,
              onPressed: _joinMeeting,
            )
          ],
        ),
      ),
    );
  }
}
