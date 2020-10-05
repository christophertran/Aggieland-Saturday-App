// External Imports
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';
import 'package:aggieland_saturday/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;

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
            Hero(
              tag: 'logo',
              child: Container(
                height: 180.0,
                child: Image.asset('images/TAM-Logo.jpg'),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              style: TextStyle(
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
              style: TextStyle(
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            buildButton(
                buttonText: "Register",
                context: context,
                nextPageID: HomeScreen.id),
          ],
        ),
      ),
    );
  }
}
