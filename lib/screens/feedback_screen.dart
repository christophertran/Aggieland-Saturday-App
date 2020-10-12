// External Imports
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';
import 'package:aggieland_saturday/components/rounded_button.dart';

class FeedbackScreen extends StatefulWidget {
  static String id = 'feedback_screen';

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  static const String _title = kFeedbackTitle;

  void _launchURL() async {
    const url = "https://www.google.com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: _title, context: context, searchBar: false),
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
                  RoundedButton(
                    title: "Google Form",
                    color: kWhitePrimary,
                    onPressed: () {
                      _launchURL();
                    },
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
