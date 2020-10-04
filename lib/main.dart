import 'package:aggieland_saturday/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:aggieland_saturday/screens/departments_and_programs_screen.dart';
import 'package:aggieland_saturday/screens/feedback_screen.dart';
import 'package:aggieland_saturday/screens/home_screen.dart';
import 'package:aggieland_saturday/screens/information_sessions_screen.dart';
import 'package:aggieland_saturday/screens/map_screen.dart';
import 'package:aggieland_saturday/screens/registration_screen.dart';
import 'package:aggieland_saturday/screens/student_organizations_screen.dart';
import 'package:aggieland_saturday/screens/welcome_screen.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(AggielandSaturday());
}

class AggielandSaturday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        DepartmentsAndProgramsScreen.id: (context) =>
            DepartmentsAndProgramsScreen(),
        FeedbackScreen.id: (context) => FeedbackScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        InformationSessionsScreen.id: (context) => InformationSessionsScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        MapScreen.id: (context) => MapScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        StudentOrganizationScreen.id: (context) => StudentOrganizationScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
