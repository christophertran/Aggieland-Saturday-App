// External Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';
import 'package:aggieland_saturday/event.dart';

// const String kHomeTitle = "Home";
// const String kInformationSessionsTitle = "Information Sessions";
// const String kFeedbackTitle = "Feedback";
// const String kStudentOrganizationsTitle = "Student Organizations";
// const String kDepartmentsAndProgramsTitle = "Departments & Programs";

class Search extends SearchDelegate {
  Search({@required String title}) {
    String collection;

    if (title == kHomeTitle) {
      collection = kAllEvents;
    } else if (title == kInformationSessionsTitle) {
      collection = kInformationSessions;
    } else if (title == kStudentOrganizationsTitle) {
      collection = kStudentOrganizations;
    } else if (title == kDepartmentsAndProgramsTitle) {
      collection = kDepartmentsAndPrograms;
    }

    this.firestoreInstance = FirebaseFirestore.instance;
    grabCollection(collection: collection);
  }

  FirebaseFirestore firestoreInstance;
  Event event;

  void grabCollection({String collection}) {
    // TODO: Grab collection from firestore based off collection string and store it for queries
  }

  void queryCollection({String query}) {
    // TODO: Query the stored collection, figure out how to do suggestions and previous searches?
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: event.name, context: context),
      backgroundColor: kMaroonPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            event.name,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
          Text(
            event.session,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
          Text(
            event.location,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
          Text(
            event.presentationTime,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
          Text(
            event.tourTime,
            style: TextStyle(fontFamily: "Open Sans"),
          ),
        ],
      ),
    );
  }

  List<String> recentList = ["Text 4", "Text 3"];
  List<String> listExample = ["Text 5", "Text 6"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];

    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(
            listExample.where((element) => element.contains(query)),
          );

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: kMaroonSecondary,
      // TODO: How do I make the search background a different color.
      // TODO: Search theme should match main theme.
      backgroundColor: kMaroonPrimary,
    );
  }
}
