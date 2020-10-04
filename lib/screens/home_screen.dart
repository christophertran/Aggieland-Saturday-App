// External Imports
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';
import 'departments_and_programs_screen.dart';
import 'feedback_screen.dart';
import 'information_sessions_screen.dart';
import 'map_screen.dart';
import 'student_organizations_screen.dart';


class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMaroonPrimary,
      body: Padding(
        padding: kDefEdgeInset,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildButton("Map", context, MapScreen.id),
            buildButton("Departments and Programs", context, DepartmentsAndProgramsScreen.id),
            buildButton("Information Sessions", context, InformationSessionsScreen.id),
            buildButton("Student Organizations", context, StudentOrganizationScreen.id),
            buildButton("Feedback", context, FeedbackScreen.id),
//            buildButton("Extra Shit", context, Extra.id),
          ],
        ),
      ),
    );
  }
}