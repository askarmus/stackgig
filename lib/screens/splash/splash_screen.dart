import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stackgig/screens/topic/topic_screen.dart';

import '../../app_controller.dart';
import '../../app_routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final AppController appController = Get.find();

    // appController.fetchLocalFavQuizIds();
    Timer(Duration(seconds: 5), () => Get.offNamed(AppRoutes.TOPIC_SCREEN));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Color(0xFF404068),
                  Color(0xFF4f4f77),
                  Color(0xFF62628a),
                  Color(0xFF73739c),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/images/stackgig-logo-icon.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "STACKGIG",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Fullstack Developer's Interview Questions and Answers",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
