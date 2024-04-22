
import 'dart:async';
import 'package:chitchat_02/Contollers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:chitchat_02/constants.dart';
import 'package:chitchat_02/Contollers/checkSession.dart';
import 'package:chitchat_02/screens/welcome_screen.dart';
import 'package:chitchat_02/Contollers/Scrollable_listview.dart';
import 'package:provider/provider.dart';



class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';

  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {

  late String message; // This stores the message typed by the user

  late final messageTextController = TextEditingController(); // This clears the textfield when user send the message.

  final fieldValueStreamController = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                logout();
                Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                },
              ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
              const Expanded(child:
              MessageBubble()),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear(); // This helps in clearing the textfield after send buttton is pressed.
                      createdocument(message);
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




