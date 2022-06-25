import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trailapp/our_components.dart';
import 'package:trailapp/our_screens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _auth = FirebaseAuth.instance;

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
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
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value){
                email=value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
              )),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password=value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password'
              )),
            SizedBox(
              height: 24.0,
            ),
            MyButton(colour: Colors.orange, title: 'Log In',
                onPressed: () async{
              try{
                final user = await _auth.signInWithEmailAndPassword(email: email!, password: password!);
                if (user != null){
                  Navigator.pushNamed(context, 'home');
                }
              } catch (e) {
                print(e);
              }
                }),
          ],
        ),
      ),
      ),
    );
  }
}