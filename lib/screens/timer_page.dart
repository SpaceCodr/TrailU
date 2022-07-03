import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

final _auth = FirebaseAuth.instance;

class _TimerPageState extends State<TimerPage> {
  double percent = 0;
  static int Timeminute = 25;
  int Timesecond = Timeminute * 60;

  late Timer timer;

  // ignore: non_constant_identifier_names
  _StartTimer() {
    print("start");
    Timeminute = 25;
    int Time = Timeminute * 60;

    // ignore: non_constant_identifier_names
    double SecPercent = (Time / 100);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (Time > 0) {
          if (Time == 1499) {
            percent += 0.001;
          }
          Time--;
          print(Time);
          if (Time % 60 == 0) {
            Timeminute--;
            print(Timeminute);
          }
          if (Time % SecPercent == 0) {
            if (percent < 1) {
              percent += 0.01;
            } else {
              percent = 1;
            }
            print("Percent=");
            print(percent);
          }
        } else {
          percent = 0;

          Timeminute = 25;
          timer.cancel();
        }
      });
    });
  }

  _StopTimer() {
    percent = 0;
    Timeminute = 25;
    timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFF6347),
                Color(0xffFF6347),
              ],
              // begin: FractionalOffset(0, 1),
            ),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  "Pomodoro Clock",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: CircularPercentIndicator(
                  backgroundColor: Colors.white70,
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 100,
                  lineWidth: 20,
                  progressColor: Colors.white,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    "$Timeminute",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFF6347),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                        right: 20,
                        left: 20,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Text(
                                        "   Study Time Duration",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "   ",
                                            style: TextStyle(
                                              fontSize: 80,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "25",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 80,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            " Minutes",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: ElevatedButton(
                                  onPressed: _StartTimer,
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red[400],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "Start Studying",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: ElevatedButton(
                                  onPressed: _StopTimer,
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red[400],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "Stop Studying",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
