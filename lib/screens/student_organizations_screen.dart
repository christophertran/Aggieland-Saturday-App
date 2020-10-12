// External Imports
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';

class StudentOrganizationScreen extends StatefulWidget {
  static String id = 'student_organizations_screen';

  @override
  _StudentOrganizationScreenState createState() =>
      _StudentOrganizationScreenState();
}

class _StudentOrganizationScreenState extends State<StudentOrganizationScreen> {
  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  static const String _title = kStudentOrganizationsTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: _title, context: context, searchBar: true),
      backgroundColor: kMaroonPrimary,
      body: buildList(
          collection: kStudentOrganizations,
          firestoreInstance: firestoreInstance),
    );
  }
}
