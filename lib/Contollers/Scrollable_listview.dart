import 'package:appwrite/models.dart';
import 'package:chitchat_02/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chitchat_02/Contollers/message_provider.dart';
import 'package:provider/provider.dart';
import 'package:chitchat_02/Contollers/user_data.dart';


// Following class independently displays the messages which come from user in listview.

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),// Use ListView.builder
      reverse: false, // Display messages in reverse chronological order
      itemCount: Provider.of<MessageProvider>(context).messages.length,
      itemBuilder: (context, index) {
        final message = Provider.of<MessageProvider>(context).messages[index];
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // This alignment put the message on the right side
            children: [
              Text(Userdata.name
                ,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),),
              Material(
                borderRadius: const BorderRadius.only(
                     topLeft: Radius.circular(30.0),
                     bottomLeft: Radius.circular(30.0),
                     bottomRight:  Radius.circular(30.0),
                ),
                color: Colors.lightBlue,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Text(message,style: const TextStyle(fontSize: 15 ),))),
          ]),
        ); // Render each message as a Text widget
      },
    );
  }
}
