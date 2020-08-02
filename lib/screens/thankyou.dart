import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Thankyou extends StatefulWidget {
  @override
  _ThankyouState createState() => _ThankyouState();
}

class _ThankyouState extends State<Thankyou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Image.asset('assets/success.gif',
            fit: BoxFit.cover),
            Container(
               alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 8.0,
                ),
              child: Text("Thank You!", 
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700), textAlign: TextAlign.center,
                    ),
            ),
            Container(
               alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 15.0,
                ),
              child: Text("You Order Have Been Placed Successfully.", 
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300), textAlign: TextAlign.center,
                    ),
            ),
             Container(
               alignment: Alignment.center,
                
              child: Text("See you Soon", 
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400), textAlign: TextAlign.center,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}