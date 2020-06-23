import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rstikapp/widgets/badge.dart';

import 'notifications.dart';

Color inactiveColor = Colors.grey;
Color activeColor = Colors.red[400];

class Reservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();

}

class _ReservationState extends State<Reservation> {

  DateTime selectedDate = DateTime.now();
  List<DateTime> selectedDates = List();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int num = 7;

  Color smoker = inactiveColor;
  Color nonSmoker = inactiveColor;
  Color alcoholic = inactiveColor;
  Color nonAlcoholic = inactiveColor;

  //type 1 = smoker or type 2 = non-smoker
  void updateColor (int type){
    if(type == 1){
      if(smoker == inactiveColor){
        smoker = activeColor;
        nonSmoker = inactiveColor;

      }else {
        smoker = inactiveColor;
      }
    } if(type == 2){
      if(nonSmoker == inactiveColor){
        nonSmoker = activeColor;
        smoker = inactiveColor;
      }else{
        nonSmoker = inactiveColor;
      }
    }
  }

  void updateColorAlcohol (int type){
    if(type == 1){
      if(alcoholic == inactiveColor){
        alcoholic = activeColor;
        nonAlcoholic = inactiveColor;

      }else {
        alcoholic = inactiveColor;
      }
    } if(type == 2){
      if(nonAlcoholic == inactiveColor){
        nonAlcoholic = activeColor;
        alcoholic = inactiveColor;
      }else{
        nonAlcoholic = inactiveColor;
      }
    }
  }

  @override
  void initState() {
    initializeDateFormatting();
    Intl.systemLocale = 'en_En'; // to change the calendar format based on localization
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void showSnackbar(String x) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(x),
      ));
    }

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
          padding: EdgeInsets.fromLTRB(10.0,20.0,10.0,0),

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
                                                updateColor(1);
                                             });
                                            },
                                            icon: Icon(
                                              Icons.smoking_rooms,
                                              color: smoker,
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
                                           updateColorAlcohol(1);
                                             });
                                            },
                                            icon: Icon(
                                              Icons.local_bar,
                                              color: alcoholic,
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
                                           updateColor(2);
                                             });
                                            },
                                            icon: Icon(
                                              Icons.smoke_free,
                                              color: nonSmoker,
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
                                           updateColorAlcohol(2);
                                             });
                                            },
                                            icon: Icon(
                                              Icons.not_interested,
                                              color: nonAlcoholic
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
                              value: num.toDouble(),
                              min: 2,
                              max: 12,
                              activeColor: Theme.of(context).accentColor,
                              inactiveColor: Colors.grey,
                              onChanged: (double newValue){
                                setState(() {
                                  num = newValue.round();
                                });
                              },
                            ),
                            Center(
                              child: Text(
                                num.toString(),
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
                                    print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                  }, currentTime: DateTime(2008, 12, 31, 23, 12, 34));
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
              Text("Checkout ",
              style: TextStyle(color: Colors.white, fontSize: 20.0),),

              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
          color: Theme.of(context).accentColor,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Reservation()),
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