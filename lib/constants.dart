// External Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/search.dart';
import 'package:aggieland_saturday/screens/event_detail_screen.dart';
import 'package:aggieland_saturday/event.dart';
import 'package:aggieland_saturday/components/rounded_button.dart';

// Firestore collection keys
const String kAllEvents = "all_events";
const String kInformationSessions = "information_sessions";
const String kFeedback = "feedback";
const String kStudentOrganizations = "student_organizations";
const String kDepartmentsAndPrograms = "departments_and_programs";

// Firestore map keys
const String kLocation = "Location";
const String kName = "Name";
const String kPresentationTime = "Presentation Time";
const String kSession = "Session";
const String kTourTime = "Tour Time";

// Screen Titles
const String kHomeTitle = "Home";
const String kInformationSessionsTitle = "Information Sessions";
const String kFeedbackTitle = "Feedback";
const String kStudentOrganizationsTitle = "Student Organizations";
const String kDepartmentsAndProgramsTitle = "Departments & Programs";

const Color kMaroonPrimary = Color(0xFF500000);
const Color kMaroonSecondary = Color(0xFF3C0000);

const Color kWhitePrimary = Color(0xFFFFFFFF);
const Color kWhiteSecondary = Color(0xFFEAEAEA);

const Color kBlueSecondary = Color(0xFF003C71);

const Color kLightGreySecondary = Color(0xFFa7a7a7);
const Color kMedGreySecondary = Color(0xFF707070);
const Color kDarkGreySecondary = Color(0xFF3e3e3e);

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

AppBar buildAppBar(
    {@required String title, @required var context, @required bool searchBar}) {
  if (searchBar) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: Search(title: title));
          },
          icon: Icon(Icons.search),
        ),
      ],
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: kWhitePrimary,
          fontFamily: "Open Sans",
          fontSize: 20,
        ),
      ),
    );
  } else {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: kWhitePrimary,
          fontFamily: "Open Sans",
          fontSize: 20,
        ),
      ),
    );
  }
}

RoundedButton buildButton(
    {@required String buttonText,
    @required var context,
    @required String nextPageID}) {
  return RoundedButton(
    title: buttonText,
    color: kWhitePrimary,
    onPressed: () {
      Navigator.pushNamed(context, nextPageID);
    },
  );
}

Widget buildList(
    {@required String collection,
    @required FirebaseFirestore firestoreInstance}) {
  return new StreamBuilder(
      stream:
          firestoreInstance.collection(collection).orderBy(kName).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data.docs.map((document) {
            return Center(
              child: Container(
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Event event = new Event(
                          name: document[kName],
                          session: document[kSession],
                          location: document[kLocation],
                          presentationTime: document[kPresentationTime],
                          tourTime: document[kTourTime]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => new EventDetail(
                            event: event,
                          ),
                        ),
                      );
                    },
                    title: Text(
                      document[kName],
                    ),
                    subtitle: Text(
                      document[kSession],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      });
}
