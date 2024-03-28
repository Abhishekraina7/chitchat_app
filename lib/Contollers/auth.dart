import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

// Appwrite sdk for Auth


// The following client object is responsible for establishing a connection with the appwrite server

Client client = Client()
  ..setEndpoint('https://cloud.appwrite.io/v1')
  ..setProject('6603843572662569be9e')
  ..setSelfSigned(status: true);

// The Account object is initialized with the client object, which allows the Account object to access the Appwrite API through the client.

    Account account = Account(client);


    //create a new user using email

Future<String> createUser(String name, String email, String password)
async
{
  try{
    await account.create(userId: ID.unique(), email: email, password: password,name: name);
    return "success";
     }
   on AppwriteException catch(e)
     {
  return e.message.toString();
     }
}

    //Login using the registered credentials

Future<String> loginUser(String email, String password)
async{
  try {
     await  account.createEmailPasswordSession(email: email, password: password);
     return "success";
  }
  on AppwriteException catch(e)
  {
    return e.message.toString();
  }
}
