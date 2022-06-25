import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

final _auth = FirebaseAuth.instance;

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TIMER',
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
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout_outlined,size: 30,),

          ),
        ],
      ),
    );
  }
}
