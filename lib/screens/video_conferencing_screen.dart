import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interact/components/custom_tab.dart';
import 'package:interact/screens/create_meet_screen.dart';
import 'package:interact/screens/join_meet_screen.dart';

class VideoConferencingScreen extends StatefulWidget {
  const VideoConferencingScreen({Key? key}) : super(key: key);

  @override
  _VideoConferencingScreenState createState() =>
      _VideoConferencingScreenState();
}

class _VideoConferencingScreenState extends State<VideoConferencingScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Interact",
            style: GoogleFonts.astloch(
                fontWeight: FontWeight.w700, fontSize: 30.0),
          ),
          backgroundColor: Colors.deepPurple.shade300,
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              CustomTab(text: "Join Meeting"),
              CustomTab(text: "Create Meeting"),
            ],
          ),
        ),
        body: TabBarView(children: [
          JoinMeetScreen(),
          CreateMeetScreen(),
        ]),
      ),
    );
  }
}
