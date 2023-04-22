import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone_with_flutter/resources/auth_methods.dart';
import 'package:zoom_clone_with_flutter/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone_with_flutter/utils/colors.dart';
import 'package:zoom_clone_with_flutter/widgets/meeting_options.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  // this is used to create an instace for the auth methods
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  // this is used to create an instace
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    // TODO: implement initState
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMetting() {
    _jitsiMeetMethods.createMeeting(
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // this is used to set the appBar of the scaffold
        appBar: AppBar(
          // this is used to set teh elevaqtion of the appBar
          elevation: 0,
          // this is used to set the background color of the appbar
          backgroundColor: backgroundColor,
          // this is used to set the title of the appBar
          title: const Text('Join a Metting',
              // this is used to set a style to teh text
              style: TextStyle(
                  // this is used ot set teh fontsize pof the text
                  fontSize: 18)),
          // this is used to cente the text on the center at the appBar
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              // this is used to set teh height of the SizedBox
              height: 60,
              child: TextField(
                // this is used to set the controller for the text field
                controller: meetingIdController,
                // this is used to set the maximum number pof lines
                maxLines: 1,
                // ths is used to set the text alignment position
                textAlign: TextAlign.center,
                // this is used to recievbe only numbers from the keyboard
                keyboardType: TextInputType.number,
                // this is used to set teh decoration for the text field
                decoration: const InputDecoration(
                    // this is used to set the fill color
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    // this is used to set the hint text
                    hintText: 'Room Id',
                    // this is used to set the content padding
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
              ),
            ),
            SizedBox(
              // this is used to set teh height of the SizedBox
              height: 60,
              child: TextField(
                // this is used to set the controller for the text field
                controller: nameController,
                // this is used to set the maximum number pof lines
                maxLines: 1,
                // ths is used to set the text alignment position
                textAlign: TextAlign.center,
                // this is used to recievbe only numbers from the keyboard
                keyboardType: TextInputType.number,
                // this is used to set teh decoration for the text field
                decoration: const InputDecoration(
                    // this is used to set the fill color
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    // this is used to set the hint text
                    hintText: 'Name',
                    // this is used to set the content padding
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
              ),
            ),
            // this is used to give a spacing in betwee the elements
            const SizedBox(height: 20),
            InkWell(
                // this is used to handle the onTap event
                onTap: _joinMetting,
                child: const Padding(
                    // this is used to set the padding
                    padding: EdgeInsets.all(8),
                    child: Text('Join', style: TextStyle(fontSize: 16)))),
            MeetingOption(
              text: 'Mute Audio',
              isMute: isAudioMuted,
              onChange: onAudioMuted,
            ),
            MeetingOption(
              text: 'Turn Off My Video',
              isMute: isVideoMuted,
              onChange: onVideoMuted,
            ),
          ],
        ));
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
