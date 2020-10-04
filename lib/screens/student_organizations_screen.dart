// External Imports
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';

class StudentOrganizationScreen extends StatefulWidget {
  static String id = 'student_organizations_screen';

  @override
  _StudentOrganizationScreenState createState() =>
      _StudentOrganizationScreenState();
}

class _StudentOrganizationScreenState extends State<StudentOrganizationScreen> {
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
                    'Student Organizations Screen',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'This screen will contain information about the organization at the event, it will include the name, a brief description, it\'s location and other essential information',
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
