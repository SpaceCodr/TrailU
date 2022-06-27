import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

final _auth = FirebaseAuth.instance;

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'MY ACCOUNT',
            style: TextStyle(
              fontFamily: 'Titlefont6',
              fontSize: 40,
              wordSpacing: 5,
            ),
          ),
          leading: null,
          automaticallyImplyLeading: false,
          foregroundColor: Colors.orange,
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _auth.signOut();
                _showSnackbar(context, 'Signing Out.......');
                Future.delayed(const Duration(seconds: 3),(){
                Navigator.pop(context);
                });
              },
              icon: const Icon(Icons.logout_outlined, size: 30,),

            ),
          ],
        ),
        body: Center(
          heightFactor: 2,
          child: Column(
            children: const [
              Text(
                'Settings',
                style: TextStyle(fontFamily: 'Titlefont5',
                    fontSize: 30,
                    fontWeight: FontWeight.normal),
              ),
              // SizedBox(
              // )
            ],
          ),

        )
    );
  }
  void _showSnackbar(BuildContext context,String text){
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      content:
        Text(
          text,
          style:
            const TextStyle(
              fontFamily: 'Titlefont3',
              color: Colors.white,
            ),
        ),
      backgroundColor: Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
