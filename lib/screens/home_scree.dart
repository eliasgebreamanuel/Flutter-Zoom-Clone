import 'package:flutter/material.dart';
import 'package:zoom_clone_with_flutter/resources/auth_methods.dart';
import 'package:zoom_clone_with_flutter/screens/history_meeting_screen.dart';
import 'package:zoom_clone_with_flutter/screens/meeting_screen.dart';

import 'package:zoom_clone_with_flutter/utils/colors.dart';
import 'package:zoom_clone_with_flutter/widgets/custom_button.dart';
import 'package:zoom_clone_with_flutter/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
  List<Widget> pages = [
     MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this is used to set the appBar for the scaffold
      appBar: AppBar(
          // this is usd to set the background color of the appBar
          backgroundColor: backgroundColor,
          // this is used to set the elevation of the appBar
          elevation: 0,
          // this is used to set the title of the appBar
          title: const Text('Meet & Chat'),
          // this is used to center the title
          centerTitle: true),
      body: pages[_page],
      // this is used to show a bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
          // this is used to set the background color of the bottom navigation bar
          backgroundColor: footerColor,
          // this is used to set the seleceted item coloe
          selectedItemColor: Colors.white,
          // this is used to set the color for the unselected item colors
          unselectedItemColor: Colors.grey,
          // this is used to handle the onTap event of the bottom navigation bar item
          onTap: onPageChanged,
          // this is used to set the current selected index number
          currentIndex: _page,
          // this is used to set the type of the bottom navigation bar items
          type: BottomNavigationBarType.fixed,
          // this is used to set the font size of the unselected items
          unselectedFontSize: 14,
          // this is used to set the iccons
          items: const [
            BottomNavigationBarItem(
                // this is used to set the icons for the bottomnavigation bar item
                icon: Icon(Icons.comment_bank),
                // this is used to set the label for the bottomnavigationbaritem
                label: 'Meet & Char'),
            BottomNavigationBarItem(
                // this is used to set the icons for the bottomnavigation bar item
                icon: Icon(Icons.lock_clock),
                // this is used to set the label for the bottomnavigationbaritem
                label: 'Meetings'),
            BottomNavigationBarItem(
                // this is used to set the icons for the bottomnavigation bar item
                icon: Icon(Icons.person_outline),
                // this is used to set the label for the bottomnavigationbaritem
                label: 'Person'),
            BottomNavigationBarItem(
                // this is used to set the icons for the bottomnavigation bar item
                icon: Icon(Icons.settings_outlined),
                // this is used to set the label for the bottomnavigationbaritem
                label: 'Settings')
          ]),
    );
  }
}
