// External Imports
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';

class FeedbackScreen extends StatefulWidget {
  static String id = 'feedback_screen';

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
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
                    'Feedback Screen',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'This screen is very important, it is meant to be a survey, either one on the app or a link to a google one, where people can fill out information about their experience.',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'In addition to this, after filling out a survey we can even display something on the screen that they can redeem for a small gift, this would be an incentive to give feedback',
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
