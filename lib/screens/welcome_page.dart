import 'package:flutter/material.dart';
import 'package:trailapp/our_components.dart';
//import 'package:trailapp/our_screens.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage('assets/mountains.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyButton(colour: Colors.orange, title: 'Log In', onPressed: (){
                Navigator.pushNamed(context, 'login');
              }),
              MyButton(colour: Colors.amber, title: 'Sign Up', onPressed: (){
                Navigator.pushNamed(context, 'signup');
              }),
            ],
          ),
        ),
      ),
    );
  }
}

