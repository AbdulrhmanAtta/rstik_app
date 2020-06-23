import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rstikapp/screens/main_screen.dart';
import 'package:rstikapp/screens/authservice.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameControl = new TextEditingController();
  final TextEditingController _emailControl = new TextEditingController();
  final TextEditingController _phoneControl = new TextEditingController();

  String phoneNo, verificationId, smsCode;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0,0,20,0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[

          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 25.0,
            ),
            child: Text(
              "Create an account",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),

          SizedBox(height: 30.0),

//          Card(
//            elevation: 3.0,
//            child: Container(
//              decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.all(
//                  Radius.circular(5.0),
//                ),
//              ),
//              child: TextField(
//                style: TextStyle(
//                  fontSize: 15.0,
//                  color: Colors.black,
//                ),
//                decoration: InputDecoration(
//                  contentPadding: EdgeInsets.all(10.0),
//                  border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(5.0),
//                    borderSide: BorderSide(color: Colors.white,),
//                  ),
//                  enabledBorder: OutlineInputBorder(
//                    borderSide: BorderSide(color: Colors.white,),
//                    borderRadius: BorderRadius.circular(5.0),
//                  ),
//                  hintText: "Username",
//                  prefixIcon: Icon(
//                    Icons.perm_identity,
//                    color: Colors.black,
//                  ),
//                  hintStyle: TextStyle(
//                    fontSize: 15.0,
//                    color: Colors.black,
//                  ),
//                ),
//                maxLines: 1,
//                controller: _usernameControl,
//              ),
//            ),
//          ),
//
//          SizedBox(height: 10.0),

//          Card(
//            elevation: 3.0,
//            child: Container(
//              decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.all(
//                  Radius.circular(5.0),
//                ),
//              ),
//              child: TextField(
//                style: TextStyle(
//                  fontSize: 15.0,
//                  color: Colors.black,
//                ),
//                decoration: InputDecoration(
//                  contentPadding: EdgeInsets.all(10.0),
//                  border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(5.0),
//                    borderSide: BorderSide(color: Colors.white,),
//                  ),
//                  enabledBorder: OutlineInputBorder(
//                    borderSide: BorderSide(color: Colors.white,),
//                    borderRadius: BorderRadius.circular(5.0),
//                  ),
//                  hintText: "Email",
//                  prefixIcon: Icon(
//                    Icons.mail_outline,
//                    color: Colors.black,
//                  ),
//                  hintStyle: TextStyle(
//                    fontSize: 15.0,
//                    color: Colors.black,
//                  ),
//                ),
//                maxLines: 1,
//                controller: _emailControl,
//              ),
//            ),
//          ),

          SizedBox(height: 10.0),

          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    this.phoneNo = val;
                  });
                },
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Phone Number",
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                obscureText: true,
                maxLines: 1,
              ),
            ),
          ),
      codeSent ? Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    this.smsCode = val;
                  });
                },
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Enter The SMS Code Sent",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                obscureText: true,
                maxLines: 1,
              ),
            ),
          ) : Container(),


          SizedBox(height: 40.0),

          Container(
            height: 50.0,
            child: RaisedButton(
              child:  codeSent ? Text("Register") : Text(
                "Verify".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: (){
                codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                    builder: (BuildContext context){
//                      return MainScreen();
//                    },
//                  ),
//                );
              },
              color: Theme.of(context).accentColor,
            ),
          ),

          SizedBox(height: 10.0),
          Divider(color: Theme.of(context).accentColor,),
          SizedBox(height: 10.0),


//          Center(
//            child: Container(
//              width: MediaQuery.of(context).size.width/2,
//              child: Row(
//                children: <Widget>[
//                  RawMaterialButton(
//                    onPressed: (){},
//                    fillColor: Colors.blue[800],
//                    shape: CircleBorder(),
//                    elevation: 4.0,
//                    child: Padding(
//                      padding: EdgeInsets.all(15),
//                      child: Icon(
//                        FontAwesomeIcons.facebookF,
//                        color: Colors.white,
////              size: 24.0,
//                      ),
//                    ),
//                  ),
//
//                  RawMaterialButton(
//                    onPressed: (){},
//                    fillColor: Colors.white,
//                    shape: CircleBorder(),
//                    elevation: 4.0,
//                    child: Padding(
//                      padding: EdgeInsets.all(15),
//                      child: Icon(
//                        FontAwesomeIcons.google,
//                        color: Colors.blue[800],
////              size: 24.0,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),

//          SizedBox(height: 20.0),


        ],
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;

      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
