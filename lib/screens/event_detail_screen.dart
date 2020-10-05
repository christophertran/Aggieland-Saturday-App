// External Imports
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/event.dart';
import 'package:aggieland_saturday/constants.dart';

class EventDetail extends StatelessWidget {
  static String id = 'event_detail_screen';

  // Event object to handle
  final Event event;

  // Constructor for the class
  EventDetail({this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: event.name),
      backgroundColor: kMaroonPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            event.name,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
          Text(
            event.session,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
          Text(
            event.location,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
          Text(
            event.presentationTime,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
          Text(
            event.tourTime,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
        ],
      ),
    );
  }
}
