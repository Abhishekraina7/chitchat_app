
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:chitchat_02/screens/welcome_screen.dart';
import 'package:chitchat_02/screens/chat_screen.dart';
import 'package:web_socket_channel/io.dart';

// The following client object is responsible for establishing a connection with the appwrite server

Client client = Client()
  ..setEndpoint('https://cloud.appwrite.io/v1')
  ..setProject('6603843572662569be9e');
  // ..setSelfSigned(status: true);
  


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


// Logout

Future logout() async{

  await account.deleteSession(sessionId: "current");
}

const databaseId = '66065cf55547546538d9';
const collectionId = '66065d65702be24e26aa';
// This function helps in accessing the appwrite database
final databases = Databases(client);


// Following function helps in performing create document functionality in the appwrite database
Future<void> createdocument(String message) async{
  try {
    await databases.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: ID.unique(),
        data: {'Message': message}
    );
  } on AppwriteException catch(e) {
    print(e);
  }
}

// Following function is used to get all the documents (messages) from the database collection

  Future<void> getdocument() async

  {
    try {
      var response = await databases.listDocuments(
        databaseId: '66065cf55547546538d9',
        collectionId: '66065d65702be24e26aa',
        // documentId: '6610f98d8c05069b028d',
      );
      if (response.documents != null) {
        // Iterate over the list of documents
        for (var document in response.documents!) {
          var fieldValue = document.data['Message']; // Replace 'fieldName' with the actual field name
          print('Field value: $fieldValue');
        }
      } else {
        print('No documents found.');
      }
    }
    on AppwriteException catch(e)
    {
      print(e);
    }
  }

// This Realtime object is used to access the realtime updated from the appwrite database

  final realtime = Realtime(client);

  Future<void> realtimeupdates() async
  {

    try{
      var subscription = await realtime.subscribe(
          [
            'databases.$databaseId.collections.$collectionId.documents'
          ]);
      // Listen for updates and print them
      subscription.stream.listen((response) {
        // how to print the specific field here?
        var fieldValue = response.payload['Message']; // Replace 'fieldName' with the actual field name
        print('Field value: $fieldValue');
      });
    }
    on AppwriteException catch(e)
    {
      print(e);
    }

  }


  // wss://cloud.appwrite.io/v1/realtime?project=6603843572662569be9e&channels%5B%5D=databases.66065cf55547546538d9.collections.66065d65702be24e26aa.documents

// Following is a Websocket which is used to listein to the realtime changes



void realtimewebsocket() {
  // WebSocket URL
  const url = 'wss://cloud.appwrite.io/v1/realtime?project=6603843572662569be9e&channels%5B%5D=databases.66065cf55547546538d9.collections.66065d65702be24e26aa.documents';

  // Create a WebSocket channel
  final channel = IOWebSocketChannel.connect(url);

  // Listen for messages
  channel.stream.listen(
        (message) {
      // Handle incoming message
      print('Received message: $message');
    },
    onError: (error) {
      // Handle errors
      print('Error: $error');
    },
    onDone: () {
      // Handle when the channel is closed
      print('Channel closed');
    },
  );
}

