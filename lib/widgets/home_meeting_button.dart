import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zoom_clone_with_flutter/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  // this is used to set the parameters for the constructor
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton({
    super.key,
    required this.onPressed,
    required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // this is used to hanle the onTap event
        onTap: onPressed,
        child: Column(children: [
          Container(
              // this is used to set the decoraion for the container
              decoration: BoxDecoration(
                  // this is used to set the color of the container
                  color: buttonColor,
                  // this is used to the border radius of the container
                  borderRadius: BorderRadius.circular(16),
                  // this is used to set the boxc shado
                  boxShadow: [
                    BoxShadow(
                        // this is used to seth the blur radius
                        blurRadius: 10,
                        // this is used to set the color of the box shadow
                        color: Colors.black.withOpacity(0.06),
                        // this is used to set the vlaue of the offset
                        offset: const Offset(0, 4))
                  ]),
              // this is used to set the width and height of the container
              width: 60,
              height: 60,
              child: Icon(icon, color: Colors.white, size: 30)),
          // this is used to give a space in betwene the elemetns
          const SizedBox(height: 10),
          Text(text,
              // this is used to set the style of the text
              style: const TextStyle(
                  // this is used to set the color of the text
                  color: Colors.grey))
        ]));
  }
}
