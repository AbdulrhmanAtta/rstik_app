import 'package:flutter/material.dart';

class Contactpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Contact us'),
      ),
      body: Contact(),
      bottomNavigationBar: Container(
        child: RaisedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
          color: Theme.of(context).accentColor,
          onPressed: () {},
        ),
      ),
    );
  }
}

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                child: TextField(
                  onChanged: (val) {
                    setState(() {});
                  },
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Title",
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
            SizedBox(height: 20.0),
            Card(
              child: Container(
                child: TextField(
                  onChanged: (val) {
                    setState(() {});
                  },
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(106.0),
                    border: InputBorder.none,
//                    border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(5.0),
//                      borderSide: BorderSide(
//                        color: Colors.white,
//                      ),
//                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Tell us your experience",
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
          ],
        ),
      ),
    );
  }
}