
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
                //Implement logout functionality
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
             Row(
              children: <Widget>[
                Container(
                 child: FloatingActionButton(
                     onPressed: ()
                     {
                   // add the logout session function call here
                       logout();
                       Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                 },
                   backgroundColor: Colors.lightBlue,

                 child:  const Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                 ),
               ),
              ],
            ),
          ],

        ),

      ),
    );
  }
}



