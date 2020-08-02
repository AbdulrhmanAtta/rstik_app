import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rstikapp/screens/checkout.dart';
import 'package:rstikapp/screens/menu.dart';
import 'package:rstikapp/widgets/badge.dart';

import 'notifications.dart';

Color inactiveColor = Colors.grey;
Color activeColor = Colors.red[400];
enum Smoke {
  smoking,
  nonSmoking,
}
enum Alcohol {
  alcoholic,
  nonAlcoholic,
}

class Reservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {

  DateTime selectedDate = DateTime.now();
  List<DateTime> selectedDates = List();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int people = 7;
  DateTime dateVal;
  
  Smoke selectSmoke;
  Alcohol selectAlcohol;
  Color smoker = activeColor;
  Color nonSmoker = inactiveColor;

  void showSnackbar(String x) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(x),
      ));
    }

  @override
  void initState() {
    initializeDateFormatting();
    Intl.systemLocale = 'en_En'; // to change the calendar format based on localization
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Reservation",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.fromLTRB(10.0,0.0,10.0,0),

          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: [
                    Center(
                      child: Text(
                        "Select Type of Hall",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                            onPressed: (){
                                              setState(() {
                                                selectSmoke = Smoke.smoking;
                                             });
                                            },
                                            icon: Icon(
                                              Icons.smoking_rooms,
                                               color: selectSmoke == Smoke.smoking
                                              ? smoker
                                              : nonSmoker
                                            ),
                                            
                                      ),
                                       Text(
                                              "For Smokers".toUpperCase(),
                                            ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                         IconButton(
                                            onPressed: (){
                                              setState(() {
                                          selectAlcohol = Alcohol.alcoholic;
                                             });
                                            },
                                            icon: Icon(
                                              Icons.local_bar,
                                               color: selectAlcohol == Alcohol.alcoholic
                                              ? smoker
                                              : nonSmoker,
                                            ),
                                            
                                      ),
                                       Text(
                                              "Alcohols".toUpperCase(),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              setState(() {
                                          selectSmoke = Smoke.nonSmoking;
                                             });
                                            },
                                            icon: Icon(
                                              Icons.smoke_free,
                                               color: selectSmoke == Smoke.nonSmoking
                                              ? smoker
                                              : nonSmoker,
                                            ),
                                            
                                      ),
                                       Text(
                                              "Non-Smokers".toUpperCase(),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              setState(() {
                                           selectAlcohol = Alcohol.nonAlcoholic;
                                             });
                                            },
                                            icon: Icon(
                                              Icons.not_interested,
                                               color: selectAlcohol == Alcohol.nonAlcoholic
                                              ? smoker
                                              : nonSmoker,
                                            ),
                                            
                                      ),
                                       Text(
                                              "Non-alcohol".toUpperCase(),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Center(
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Text(
                                "Number of People",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Slider(
                              value: people.toDouble(),
                              min: 2,
                              max: 12,
                              activeColor: Theme.of(context).accentColor,
                              inactiveColor: Colors.grey,
                              onChanged: (newValue){
                                setState(() {
                                  people = newValue.round();
                                });
                              },
                            ),
                            Center(
                              child: Text(
                                people.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Date of Booking',
                                style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,),
                              ),
                            ),
                            SizedBox(height: 15.0,),
                            RaisedButton(
                              color: Colors.red[400],
                                onPressed: () {
                                  
                                  DatePicker.showDateTimePicker(context, showTitleActions: true, onChanged: (date) {
                                    dateVal = date;
                                    print('change $dateVal in time zone ' + date.timeZoneOffset.inHours.toString());
                                  }, onConfirm: (date) {
                                    print('confirm $dateVal');
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Your Reservation Date: $dateVal"), 
                                    backgroundColor: Colors.green,));
                                  }, currentTime: DateTime.now());
                                },
                                child: Text(
                                  'Pick Your Date And Time',
                                  style: TextStyle(color: Colors.white),
                                ),
                            ),
                          ],
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
      bottomNavigationBar: Container(
        height: 50.0,
        child: RaisedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Checkout ",
              // style: TextStyle(color: Colors.white, fontSize: 20.0),),

             Text(
            "CHECKOUT",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
            ],
          ),
          color: Theme.of(context).accentColor,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Checkout(people: people, date: dateVal,)),
            );
          },
        ),
      ),
    );
  }
}

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale}) : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentTime.year, currentTime.month, currentTime.day,
        this.currentLeftIndex(), this.currentMiddleIndex(), this.currentRightIndex())
        : DateTime(currentTime.year, currentTime.month, currentTime.day, this.currentLeftIndex(),
        this.currentMiddleIndex(), this.currentRightIndex());
  }
}