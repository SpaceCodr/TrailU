import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailapp/our_components.dart';

//
// String getSignupMessageFromErrorCode() {
//   var errorCode;
//   switch (errorCode) {
//     case "auth/invalid-display-name":
//     case "auth/invalid-email":
//       return " Invalid email name!";
//     case "auth/email-already-exists":
//       return "Email already used. Go to login page.";
//     case "auth/invalid-password":
//       return "Weak Password!";
//     case "ERROR_USER_DISABLED":
//     case "user-disabled":
//       return "User disabled.";
//     case "ERROR_TOO_MANY_REQUESTS":
//     case "operation-not-allowed":
//       return "Too many requests to log into this account.";
//     case "ERROR_OPERATION_NOT_ALLOWED":
//     case "operation-not-allowed":
//       return "Server error, please try again later.";
//     default:
//       return "Signup failed. Please try again.";
//   }
// }

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.blueGrey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.amber, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.amber, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _auth = FirebaseAuth.instance;
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
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your passsword')),
              SizedBox(
                height: 24.0,
              ),
              MyButton(
                  colour: Colors.amber,
                  title: 'Sign Up',
                  onPressed: () async {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email!, password: password!);
                      if (newUser != null) {
                        Navigator.pushNamed(context, 'home');
                      }
                    } on FirebaseAuthException catch (error) {
                      //var errorMessage = getSignupMessageFromErrorCode();
                      print(error.code);
                      _showSnackbar(context, error.code);
                    } on Exception catch (error) {
                      if (email == " ") {
                        _showSnackbar(
                            context, "Email address cannot be empty!");
                      } else if (password == " ") {
                        _showSnackbar(
                            context, "password cannot be empty!");
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      content: Text(
        text,
        style: const TextStyle(fontFamily: 'Titlefont3', color: Colors.white),
      ),
      backgroundColor: Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
