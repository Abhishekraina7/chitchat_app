
import 'package:chitchat_02/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:chitchat_02/constants.dart';
import 'package:chitchat_02/Contollers/checkSession.dart';



class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';

  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {

  late String message;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                realtimeupdates();
                realtimewebsocket();
                // logout();
                // Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                },
              ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Appwrite database implement karro
                      createdocument(message);
                      // Figure out how to send the data to the Appwrite database and retrieve from it and send to the other user
                    },
                    child: const Icon(Icons.send, color: Colors.lightBlue),
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



