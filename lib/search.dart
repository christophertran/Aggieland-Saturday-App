// External Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Internal Imports
import 'package:aggieland_saturday/constants.dart';
import 'package:aggieland_saturday/event.dart';
import 'package:aggieland_saturday/screens/event_detail_screen.dart';

class Search extends SearchDelegate {
  Search({@required String title}) {
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
    grabCollection();
  }

  FirebaseFirestore firestoreInstance;

  String collection;
  List<String> recentList = [];
  List<Event> events = [];
  List<String> eventNames = [];

  void grabCollection() async {
    firestoreInstance.collection(collection).get().then((value) => {
          value.docs.forEach((element) {
            eventNames.add(element[kName]);
            events.add(Event(
                name: element[kName],
                session: element[kSession],
                location: element[kLocation],
                presentationTime: element[kPresentationTime],
                tourTime: element[kTourTime]));
          })
        });
  }

  Event getEvent({@required String eventName}) {
    for (Event ev in events) {
      if (ev.name.toUpperCase() == eventName.toUpperCase()) {
        return ev;
      }
    }
    return null;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          if (query == "") {
            Navigator.pop(context);
          }
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
        // this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Event event = getEvent(eventName: query);
    if (event == null) {
      // TODO: Find out how to return a page for a partial query rather than saying no results
      return Scaffold(
        backgroundColor: kMaroonPrimary,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "No results",
                style: TextStyle(fontFamily: "Open Sans"),
              )
            ]),
      );
    }

    // TODO: Have this return an event detail page without a back button/app bar??
    return EventDetail(event: event);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];

    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(
            eventNames.where(
              (element) => element.toUpperCase().contains(query.toUpperCase()),
            ),
          );

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Center(
          child: Container(
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => EventDetail(
                        event: getEvent(eventName: suggestionList[index]),
                      ),
                    ),
                  );
                },
                title: Text(suggestionList[index]),
              ),
            ),
          ),
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
