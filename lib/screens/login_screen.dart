import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zoom_clone_with_flutter/resources/auth_methods.dart';
import 'package:zoom_clone_with_flutter/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // this is used to create an instance for teh auth methods
  final AuthMethods _authMehtods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            // this is used to set the elements of the column at the center
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const Text('Start or join a metting',
              // this is used to set the style of the text
              style: const TextStyle(
                  // this is use dot set the font size of the text
                  fontSize: 24,
                  // this is used to set the fontwweight of the text
                  fontWeight: FontWeight.bold)),
          // this is used to show an image file from the assets folder
          Padding(
            // this is used to set the padding from the top and bottom direction
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(
              text: 'Google Sign In',
              onPressed: () async {
                // this is used to sign in the user
                bool res = await _authMehtods.signInWithGoogle(context);
                if (res) {
                  // this is used ot navigate to the home screen
                  Navigator.pushNamed(context, '/home');
                }
              })
        ]));
  }
}
