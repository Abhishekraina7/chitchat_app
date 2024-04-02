
import 'package:flutter/material.dart';
import 'package:chitchat_02/screens/welcome_screen.dart';
import 'package:chitchat_02/screens/login_screen.dart';
import 'package:chitchat_02/screens/registration_screen.dart';
import 'package:chitchat_02/screens/chat_screen.dart';
import 'package:chitchat_02/Contollers/checkSession.dart';


// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_performance/firebase_performance.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// void configureFirebaseLogging() {
//   FirebaseCrashlytics.instance.setCustomKey('App', 'Chitchat');
//   FirebaseCrashlytics.instance.setCustomKey('Version', '1.0.0');
//   FirebaseCrashlytics.instance.setCustomKey('Platform', 'Android');
//   FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
//   FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
//   FirebaseFirestore.instance.settings = const Settings(
//     persistenceEnabled: false,
//   );
//   Firebase.initializeApp();
// }
//
// FirebaseOptions getFirebaseOptions() {
//   return const FirebaseOptions(
//     appId: 'YOUR_APP_ID',
//     apiKey: 'YOUR_API_KEY',
//     authDomain: 'YOUR_AUTH_DOMAIN',
//     messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
//     projectId: 'YOUR_PROJECT_ID',
//   );
// }

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const chitchat_02());
}

class chitchat_02 extends StatelessWidget {
  const chitchat_02({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      // home: const WelcomeScreen(), // anyscreen in home open first when the app is started
      initialRoute: CheckSession.id, // similar to home.
      routes: {
        ChatScreen.id:(context) =>  const ChatScreen(),
        LoginScreen.id:(context) =>  const LoginScreen(),
        RegistrationScreen.id:(context) =>  const RegistrationScreen(),
        WelcomeScreen.id:(context) =>  const WelcomeScreen(),
        CheckSession.id:(context) => const CheckSession(),

      },
    );
  }
}

class CheckSession extends StatefulWidget {

  static const String id = 'CheckSession';
  const CheckSession({super.key});

  @override
  State<CheckSession> createState() => _CheckSessionState();
}

class _CheckSessionState extends State<CheckSession> {
  @override
  void initState() {
    checkSessions().then((value) => {
      if(value){
        Navigator.pushReplacementNamed(context, ChatScreen.id),
      }
      else{
        Navigator.restorablePopAndPushNamed(context, WelcomeScreen.id),
      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

