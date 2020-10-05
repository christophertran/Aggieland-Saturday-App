// External Imports
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';

class DepartmentsAndProgramsScreen extends StatefulWidget {
  static String id = 'departments_and_programs_screen';

  @override
  _DepartmentsAndProgramsScreenState createState() =>
      _DepartmentsAndProgramsScreenState();
}

class _DepartmentsAndProgramsScreenState
    extends State<DepartmentsAndProgramsScreen> {
  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  static const String _title = "Departments & Programs";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: _title),
      backgroundColor: kMaroonPrimary,
      body: buildList(
          collection: kDepartmentsAndPrograms,
          firestoreInstance: firestoreInstance),
    );
  }
}
