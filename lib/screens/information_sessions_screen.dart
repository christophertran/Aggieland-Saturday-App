// External Imports
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';

class InformationSessionsScreen extends StatefulWidget {
  static String id = 'information_sessions_screen';

  @override
  _InformationSessionsScreenState createState() =>
      _InformationSessionsScreenState();
}

class _InformationSessionsScreenState extends State<InformationSessionsScreen> {
  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  static const String _title = "Information Sessions";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: _title),
      backgroundColor: kMaroonPrimary,
      body: buildList(
          collection: kInformationSessions,
          firestoreInstance: firestoreInstance),
    );
  }
}
