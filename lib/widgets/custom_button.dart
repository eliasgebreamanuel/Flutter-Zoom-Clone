import 'package:flutter/material.dart';
import 'package:zoom_clone_with_flutter/utils/colors.dart';

class CustomButton extends StatelessWidget {
  // this is used to set the constructor parameters
  final String text;
  // this is used to pass a functiona as a parameter
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // this is used to set the padding
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
          // this is used to handle the onpressed functionality
          onPressed: onPressed,
          child: Text(text,
              // this is used to set the style of the text
              style: const TextStyle(
                  // this is used to set the font Size of the text
                  fontSize: 17)),
          // this is used to set the style of the button
          style: ElevatedButton.styleFrom(
              primary: buttonColor,
              // this is used to set the height and width of the button
              minimumSize: const Size(
                  // this is used to take all the  avilable width
                  double.infinity,
                  50),
              // this is used to set the border radius
              shape: RoundedRectangleBorder(
                  // this is used to set the border radius
                  borderRadius: BorderRadius.circular(30),
                  // this is used to set a custom color for the border radius
                  side: const BorderSide(color: buttonColor)))),
    );
  }
}
