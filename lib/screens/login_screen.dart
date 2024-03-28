import 'package:flutter/material.dart';
import 'package:chitchat_02/constants.dart';
import 'package:chitchat_02/components/buttons.dart';
import 'package:chitchat_02/Contollers/auth.dart';
import 'package:chitchat_02/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'loginScreen';

  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF95FF80) ,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 170.0,
                  child: Image.asset('images/loginscreenback.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: kMessageTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: kMessageTextFieldDecoration.copyWith(hintText: 'Enter your Password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Buttons(color: const Color(0xFF95FF80), name: 'Log in',
              onPressed: (){
                Navigator.pushNamed(context, ChatScreen.id);
                loginUser(email, password).then((value) {
                  {
                    if(value == "success"){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                        content: const Text(
                          "Login Successfull",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green.shade400,
                      ));

                    }
                    else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                        content: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red.shade400,
                      ));
                    }
                  }
                });
              },),

          ],
        ),
      ),
    );
  }
}
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 16.0),
// child: Material(
// color: const Color(0xFF95FF80),
// borderRadius: const BorderRadius.all(Radius.circular(30.0)),
// elevation: 5.0,
// child: MaterialButton(
// onPressed: () {
// //Implement login functionality.
// },
// minWidth: 200.0,
// height: 35.0,
// child:  const SingleChildScrollView(child: Text('Log In',)),
// ),
// ),
// ),
