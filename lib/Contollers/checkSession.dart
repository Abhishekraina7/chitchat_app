import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';

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


