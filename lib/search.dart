// External Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';
import 'package:aggieland_saturday/event.dart';

class Search extends SearchDelegate {
  Search({String collection, FirebaseFirestore firestoreInstance});

  String collection;
  FirebaseFirestore firestoreInstance;

  void buildEvent(var value) {}

  void queryFirestore({@required String query}) {
    if (firestoreInstance == null) {
      firestoreInstance = FirebaseFirestore.instance;
    }
    if (collection == null) {
      collection = kAllEvents;
    }

    // firestoreInstance
    //     .collection(collection)
    //     .where(kName, isEqualTo: query)
    //     .get()
    //     .then((value) => value.);
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
    Event event;

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
