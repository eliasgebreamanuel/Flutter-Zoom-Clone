import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone_with_flutter/resources/auth_methods.dart';
import 'package:zoom_clone_with_flutter/screens/home_scree.dart';
import 'package:zoom_clone_with_flutter/screens/login_screen.dart';
import 'package:zoom_clone_with_flutter/screens/video_call_screen.dart';
import 'package:zoom_clone_with_flutter/utils/colors.dart';

void main() async {
  // this is used to ensure if widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // this is used to initialize firebase app
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // this is used to hide the debig show checked mode banner from the screen
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      // this is used to create the routes for navigation
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video-call': (context) => const VideoCallScreen()
      },
      home: StreamBuilder(
          stream: AuthMethods().authChanges,
          builder: (context, snapshot) {
            // this is used to check if the connection state is in a waiting mode
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // this is used to check if the snapshot has deata
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return LoginScreen();
          }),
    );
  }
}
