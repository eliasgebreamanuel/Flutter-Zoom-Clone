import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone_with_flutter/resources/auth_methods.dart';
import 'package:zoom_clone_with_flutter/resources/firestore_methods.dart';

class JitsiMeetMethods {
  // this is used to create an instance for the AuthMethods
  final AuthMethods _authMethods = AuthMethods();
  // this is used tpo create an instance for the firestore methods
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ""}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;
      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      } // Limit video resolution to 360p
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
