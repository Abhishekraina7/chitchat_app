import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chitchat_02/screens/welcome_screen.dart';
import 'package:chitchat_02/screens/chat_screen.dart';

// The following client object is responsible for establishing a connection with the appwrite server

Client client = Client()
  ..setEndpoint('https://cloud.appwrite.io/v1')
  ..setProject('6603843572662569be9e')
  ..setSelfSigned(status: true);

// The Account object is initialized with the client object, which allows the Account object to access the Appwrite API through the client.

Account account = Account(client);


Future checkSessions() async{
  try{
    await account.getSession(sessionId: "current");
    return true;
  }
  catch(e)
  {
    return false;
  }

}
// The widget below checks weather the user is logged in or not and direct accordingly to specific screens

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


