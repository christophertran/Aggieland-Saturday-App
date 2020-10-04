// External Imports
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';

class MapScreen extends StatefulWidget {
  static String id = 'map_screen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
                    'Map Screen',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'This screen will contain a map of zachry, hopefully interactive, but the main goal is to provide a digital version of the map, and buttons to click on each floor.',
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
