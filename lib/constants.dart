// External Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/components/rounded_button.dart';

// Firestore instance
final kFirestoreInstance = FirebaseFirestore.instance;

// Firestore collection keys
const String kInformationSessions = "information_sessions";
const String kFeedback = "feedback";
const String kStudentOrganizations = "student_organizations";
const String kDepartmentsAndPrograms = "departments_and_programs";

// Firestore map keys
const String kLocation = "Location";
const String kName = "Name";
const String kPresentationTime = "Presentation time";
const String kSession = "Session";
const String kTourTime = "Tour Time";

const Color kMaroonPrimary = Color(0xFF500000);
const Color kMaroonSecondary = Color(0xFF3C0000);

const Color kWhitePrimary = Color(0xFFFFFFFF);
const Color kWhiteSecondary = Color(0xFFEAEAEA);

const Color kBlueSecondary = Color(0xFF003C71);

const EdgeInsets kDefEdgeInset = EdgeInsets.symmetric(horizontal: 20.0);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMaroonSecondary, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMaroonSecondary, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

RoundedButton buildButton(String buttonText, var context, String nextPageID) {
  return RoundedButton(
    title: buttonText,
    color: kWhitePrimary,
    onPressed: () {
      Navigator.pushNamed(context, nextPageID);
    },
  );
}
