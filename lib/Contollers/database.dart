import 'package:appwrite/appwrite.dart';

void main() async {
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('<6603843572662569be9e>');

  final databases = Databases(client);

  try {
    final document = databases.createDocument(
        databaseId: '<66065cf55547546538d9>',
        collectionId: '<66065d65702be24e26aa>',
        documentId: ID.unique(),
        data: { "title": "Hamlet" }
    );
  } on AppwriteException catch(e) {
    print(e);
  }
}
