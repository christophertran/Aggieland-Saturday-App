// External Imports
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';
import 'package:aggieland_saturday/screens/departments_and_programs_screen.dart';
import 'package:aggieland_saturday/screens/feedback_screen.dart';
import 'package:aggieland_saturday/screens/information_sessions_screen.dart';
import 'package:aggieland_saturday/screens/map_screen.dart';
import 'package:aggieland_saturday/screens/student_organizations_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: _title),
      backgroundColor: kMaroonPrimary,
      body: Padding(
        padding: kDefEdgeInset,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildButton(
                buttonText: "Map", context: context, nextPageID: MapScreen.id),
            buildButton(
                buttonText: "Departments and Programs",
                context: context,
                nextPageID: DepartmentsAndProgramsScreen.id),
            buildButton(
                buttonText: "Information Sessions",
                context: context,
                nextPageID: InformationSessionsScreen.id),
            buildButton(
                buttonText: "Student Organizations",
                context: context,
                nextPageID: StudentOrganizationScreen.id),
            buildButton(
                buttonText: "Feedback",
                context: context,
                nextPageID: FeedbackScreen.id),
          ],
        ),
      ),
    );
  }
}
