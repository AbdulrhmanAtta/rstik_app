import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rstikapp/screens/walkthrough.dart';
import 'package:rstikapp/util/const.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const List<String> labels = [
  "Rotate",
  "Fade",
  "Typer",
  "Typewriter",
  "Scale",
  "Colorize",
  "TextLiquidFill"
];

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimeout() {
    return  Timer(Duration(seconds: 4), changeScreen);
  }

  changeScreen() async{
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){
          return Walkthrough();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    startTimeout();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        margin: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.fastfood,
                size: 150.0,
                color: Theme.of(context).accentColor,
              ),

              SizedBox(width: 40.0),
              
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 15.0,
                ),
                child: TyperAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed: Duration(milliseconds: 350),
                  onTap: () {},
                  text: ["${Constants.appName}"],
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).accentColor,
                  ),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
