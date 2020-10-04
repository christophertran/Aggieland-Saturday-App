// External Imports
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';

class InformationSessionsScreen extends StatefulWidget {
  static String id = 'information_sessions_screen';

  @override
  _InformationSessionsScreenState createState() =>
      _InformationSessionsScreenState();
}

class _InformationSessionsScreenState extends State<InformationSessionsScreen> {
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
                    'Information Sessions Screen',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'This screen will contain information about the days available information session as well as a brief description of them, their location and when it is happening.',
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
