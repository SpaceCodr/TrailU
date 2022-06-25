import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
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
    return  AnnotatedRegion<SystemUiOverlayStyle>(
        value:SystemUiOverlayStyle(
          systemNavigationBarColor: navigationBarColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      child: Scaffold(
      backgroundColor: Colors.grey,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,

      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index){
          setState((){
            selectedIndex = index;
          });
          pageController.animateToPage(selectedIndex, duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        activeColor: Colors.transparent,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(title: 'Tasks', icon: Icons.task_alt_rounded,activeColor: Colors.orange,inactiveColor: Colors.white30),
          BarItem(title: 'Timer', icon: Icons.access_time_rounded,activeColor: Colors.deepPurple,inactiveColor: Colors.white30),
          BarItem(title: 'Stats', icon: Icons.bar_chart,activeColor: Colors.pink,inactiveColor: Colors.white30),
          BarItem(title: 'Account', icon: Icons.account_circle_rounded,activeColor: Colors.red,inactiveColor: Colors.white30),
        ],
      ),
      appBar: AppBar(
        foregroundColor: Colors.orange,
        backgroundColor: Colors.redAccent,
        leading: null,
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
    ),
    );
  }
}