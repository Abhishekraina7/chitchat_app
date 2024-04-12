
import 'package:flutter/material.dart';
import 'package:chitchat_02/screens/welcome_screen.dart';
import 'package:chitchat_02/screens/login_screen.dart';
import 'package:chitchat_02/screens/registration_screen.dart';
import 'package:chitchat_02/screens/chat_screen.dart';
import 'package:chitchat_02/Contollers/checkSession.dart';
import 'package:provider/provider.dart';

import 'Contollers/message_provider.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const chitchat_02());
}

class chitchat_02 extends StatelessWidget {
  const chitchat_02({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      // home: const WelcomeScreen(), // anyscreen in home open first when the app is started
      initialRoute: CheckSession.id, // similar to home.
      routes: {
        ChatScreen.id:(context) =>  ChangeNotifierProvider<MessageProvider>(
          create: (context) => MessageProvider(),
          child: ChatScreen(),
        ),
        LoginScreen.id:(context) =>  const LoginScreen(),
        RegistrationScreen.id:(context) =>  const RegistrationScreen(),
        WelcomeScreen.id:(context) =>  const WelcomeScreen(),
        CheckSession.id:(context) => const CheckSession(),

      },
    );
  }
}


