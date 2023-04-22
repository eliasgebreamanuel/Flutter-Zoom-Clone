import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone_with_flutter/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreMethods().mettingHistory,
        builder: (context, snapshot) {
          // this is used ot check if the connection sytate is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (contex, index) => ListTile(
            // this is used to set the title of the list
                title: Text(
                    'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}')
                    // this is used to set the subtitle
                    ,subtitle: Text(
                      'Joined on ${ DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'
                    ),
                    ),
          );
        });
  }
}
