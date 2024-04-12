import 'package:chitchat_02/Contollers/message_provider.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chitchat_02/constants.dart';
import 'package:chitchat_02/Contollers/checkSession.dart';
import 'package:provider/provider.dart';



class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';


  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {

  late String message;
  final fieldValueStreamController = StreamController<String>();


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // realtimeupdates();
                // realtimewebsocket();
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             Expanded(
              child: ListView.builder( // Use ListView.builder
                reverse: false, // Display messages in reverse chronological order
                itemCount: Provider.of<MessageProvider>(context).messages.length,
                itemBuilder: (context, index) {
                  final message = Provider.of<MessageProvider>(context).messages[index];
                  return Text(message); // Render each message as a Text widget
                },
              ),
            ),

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



