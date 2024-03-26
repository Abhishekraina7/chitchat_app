
import 'package:chitchat_02/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:chitchat_02/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chitchat_02/components/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcomeScreen';
  
   const WelcomeScreen({super.key});
  
  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin { //By using this mixin our state object act as the ticker for animation controller

  late AnimationController controller;
  late Animation animation;


  @override

  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, // read the documentation to fully understand about this
    duration: const Duration(seconds: 2)
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutBack);

      controller.forward(); // This controls the scale of animation, wheather animations goes from higher value to smaller or reverse.

    animation.addStatusListener((status) {print(status);}); // We can use this to loop our animation from forward to reverse loop by checking status and putting coditions on it
    controller.addListener(() {

      setState(() {});}
    ); // This is used because for every changed number value of opacity in background color changes
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(controller.value), //We used the changing value from animation controller via listeiner
      body: Stack(
        children: <Widget>[
          Center(
            child: Hero(
              tag: 'flash',
              child: Container(
                margin : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 250.0),
                height: animation.value * 200,
                child:  Image.asset('images/welcomescreenback.png'),
              ),
            ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                // margin : const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 100.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(100.0, 0.0, 50.0, 0.0),
                      height: 50,
                      width: 50,
                      // child: Image.asset('images/logo.png',),
                    ),
                  ],
                )
              ),
              const SizedBox(
                height: 48.0,
              ),
              Buttons(color: const Color(0xFF95FF80), name: 'Log in', onPressed: (){Navigator.pushNamed(context, LoginScreen.id);},),
              Buttons(color: const Color(0xFF1E284C), name: 'Register', onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);},),

            ],
          ),
        ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(125.0, 750.0, 0.0, 0.0),
                child:  AnimatedTextKit(animatedTexts:
                [
                  WavyAnimatedText('Welcome to chitchat!'),
                ],
                  isRepeatingAnimation: true,),
              ),
            ],
          ),
    ],
      ),
    );
  }
}
