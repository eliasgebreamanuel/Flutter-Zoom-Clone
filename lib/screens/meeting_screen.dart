import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zoom_clone_with_flutter/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone_with_flutter/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  // this is used ot create an instance for the JitsiMeetMethods
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async {
    // this is used to generate a random number
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  // this is used to join a metting
  joinMeeting(BuildContext context) {
    // this is used to navigate to the vikdeo call screeen
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // this is used to distriubute the space in between items evenly
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
                onPressed: createNewMeeting,
                text: 'New Meeting',
                icon: Icons.videocam),
            HomeMeetingButton(
                onPressed: () => joinMeeting(context),
                text: 'Join Meeting',
                icon: Icons.add_box_rounded),
            HomeMeetingButton(
                onPressed: () {}, text: 'Schedule', icon: Icons.calendar_today),
            HomeMeetingButton(
                onPressed: () {},
                text: 'Share Screen',
                icon: Icons.arrow_upward_rounded),
          ],
        ),
        const Expanded(
          child: Center(
              child: Text('Create/Join Mettings with just a click',
                  // this is used to set the style of the text
                  style: TextStyle(
                      // this is used to set the fontweight of the text
                      fontWeight: FontWeight.bold,
                      // this is used to set the fontsize of the text
                      fontSize: 18))),
        )
      ],
    );
  }
}
