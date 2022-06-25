import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailapp/our_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Both of the following lines are good for testing,
  // but can be removed for release builds
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  //FirebaseAuth.instance.signOut();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplashScreen',
      debugShowCheckedModeBanner: false,
      //initialRoute: '/login',
      routes: {
        'welcome':(context) => const WelcomePage(),
        'signup': (context) => const SignupPage(),
        'login': (context) => const LoginPage(),
        'home': (context) =>const HomePage(),
        //  'account': (context) => AccountPage(),
        //  'addTask': (context) => TasksAddPage(),
        // 'register': (context) => Register(),
        // 'stats': (context) => StatsPage(),
        // 'timer': (context) => TimerPage()
      },
      home: AnimatedSplashScreen(
        splashIconSize: 500,
        backgroundColor: const Color(0xfffaa026),
        splash: 'assets/sand-clock.gif',
        nextScreen: const WelcomePage(),
        splashTransition: SplashTransition.rotationTransition,
        duration: 3000,
      ),
    );
  }
}