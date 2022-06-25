import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

final _auth = FirebaseAuth.instance;

class _StatsPageState extends State<StatsPage> {
  final List<String> userLevels =[
    'Iron',
    'Bronze ',
    'Silver',
    'Gold',
    'Platinum',
    'Diamond',
    'Ascendant',
    'Immortal',
    'Radiant'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'STATISTICS',
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
