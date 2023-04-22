import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zoom_clone_with_flutter/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  // this is used to set the parameters for the constructor
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  const MeetingOption({super.key, required this.text, required this.isMute, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        // this is used to seth the height of the container
        height: 60,
        // this is used to set th ecolor of the container
        color: secondaryBackgroundColor,
        child: Row(
          // this is used t separate the elemetns of the row
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              // this is used to set the padding

              padding: const EdgeInsets.all(8.0),
              child: Text(text, style: const TextStyle(fontSize: 16)),
            ),
            Switch.adaptive(value: isMute, onChanged: onChange,)
          ],
        ));
  }
}
