import 'package:appwrite/appwrite.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';


const databaseId = '66065cf55547546538d9';
const collectionId = '66065d65702be24e26aa';

Client client = Client()
  ..setEndpoint('https://cloud.appwrite.io/v1')
  ..setProject('6603843572662569be9e');
// ..setSelfSigned(status: true);





final realtime = Realtime(client);
final List<String> _messages = [];

Future<void> realtimeupdates()
async {

  try{
    var subscription = await realtime.subscribe(
        [
          'databases.$databaseId.collections.$collectionId.documents'
        ]);
    // Listen for updates and print them
    subscription.stream.listen((response) {
      // how to print the specific field here?
      var messageData = response.payload['Message'];
      _messages.add(messageData);
      print('$messageData');

    });
  }
  on AppwriteException catch(e)
  {
    print(e);
  }

}

class MessageProvider extends ChangeNotifier {

  List<String> get messages => _messages; // Getter for messages

  Future<void> subscribeToMessages() async {
    // Call your realtimeupdates function here to set up subscription and update _messages
    await realtimeupdates();
  }
  void addMessage(String message) {
    _messages.add(message);
    notifyListeners(); // Notify listeners when a message is added
  }
  @override
  MessageProvider(){
    subscribeToMessages();
  }
}




