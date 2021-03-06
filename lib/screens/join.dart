import 'package:flutter/material.dart';
import 'package:rstikapp/screens/login.dart';
import 'package:rstikapp/screens/register.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rstikapp/screens/authservice.dart';


class JoinApp extends StatefulWidget {
  @override
  _JoinAppState createState() => _JoinAppState();
}



class _JoinAppState extends State<JoinApp> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(vsync: this, initialIndex: 1, length: 1);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        
        // TabBar(
        //   controller: _tabController,
        //   indicatorColor: Theme.of(context).accentColor,
        //   labelColor: Theme.of(context).accentColor,
        //   unselectedLabelColor: Colors.grey,
        //   labelStyle: TextStyle(
        //     fontSize: 20.0,
        //     fontWeight: FontWeight.w800,
        //   ),
        //   unselectedLabelStyle: TextStyle(
        //     fontSize: 20.0,
        //     fontWeight: FontWeight.w800,
        //   ),
        //   tabs: <Widget>[
        //     Tab(
        //       text: "Login",
        //     ),
        //     Tab(
        //       text: "Register",
        //     ),
        //   ],
        // ),
      ),

      body: RegisterScreen(),
      // TabBarView(
      //   controller: _tabController,
      //   children: <Widget>[
      //     // LoginScreen(),
      //     RegisterScreen(),
      //   ],
      // ),


    );
  }
}
