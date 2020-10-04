// External Imports
import 'package:flutter/material.dart';

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
            Center(
              child: Column(
                children: [
                  Text(
                    'Departments & Programs Screen',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'This screen will contain information about the departments/programs available at the event',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Information including brief description of department/program, where they are located, and their events for the day',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
