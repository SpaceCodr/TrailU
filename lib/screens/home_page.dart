import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';


User? loggedinUser;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;

  void initState() {
    // Detect when a user signs in (or out, when sign out is implemented)
    super.initState();
    getCurrentUser();
    pageController = PageController(initialPage: selectedIndex);
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,

      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.black,
        onButtonPressed: (index){
          setState((){
            selectedIndex = index;
          });
          pageController.animateToPage(selectedIndex, duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(title: 'Tasks', icon: Icons.task_alt_rounded,activeColor: Colors.blue,inactiveColor: Colors.orange),
          BarItem(title: 'Timer', icon: Icons.access_time_rounded,activeColor: Colors.purple,inactiveColor: Colors.orange),
          BarItem(title: 'Stats', icon: Icons.bar_chart,activeColor: Colors.pink,inactiveColor: Colors.orange),
          BarItem(title: 'Account', icon: Icons.account_circle_rounded,activeColor: Colors.cyan,inactiveColor: Colors.orange),
        ],
      ),
      appBar: AppBar(
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
              icon: Icon(Icons.logout_outlined),

          ),
        ],
      ),
    );
  }
}