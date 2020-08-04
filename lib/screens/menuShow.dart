import 'package:flutter/material.dart';
import 'package:rstikapp/screens/cartScreen.dart';
import 'package:rstikapp/screens/checkout.dart';
import 'package:rstikapp/screens/menu.dart';
import 'package:rstikapp/screens/reservation.dart';
import 'package:rstikapp/widgets/badge.dart';
import 'menu_items/pizzaShow.dart' as pizzaShow;
import 'menu_items/alcoholsShow.dart' as alcoholShow;
import 'menu_items/burgersShow.dart' as burgerShow;
import 'menu_items/snacksShow.dart' as snacksShow;
import 'menu_items/coffeeShow.dart' as coffeeShow;
import 'notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuShow extends StatefulWidget {
  final String email;

  const MenuShow({Key key, this.email}) : super(key: key);

  @override
  MyTabsState createState() => new MyTabsState(email);
}

class MyTabsState extends State<MenuShow> with SingleTickerProviderStateMixin {

  String email;
  MyTabsState(this.email);
  TabController controller;
  String item1;
  String item2;
  String item3;
  String item4;
  String item5;
  var firestore = Firestore.instance;

  Future getcategories() async{
  QuerySnapshot qn  = await firestore.collection('restaurants').document(email).collection('Menu').document(email + 'Menu').collection('Categories').getDocuments();
    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Menu",
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
        bottom: TabBar(
          controller: controller,
          tabs: [
          Tab(text: "pizza"),
          Tab(text: "snack",),
          Tab(text: "coffee",),
          Tab(text: "alcohol",),
          Tab(text: "burger",),
        ],),
      ),
//        bottomNavigationBar: new Material(
//            color: Colors.deepOrange,
//            child: new TabBar(
//                controller: controller,
//                tabs: <Tab>[
//                  new Tab(icon: new Icon(Icons.arrow_forward)),
//                  new Tab(icon: new Icon(Icons.arrow_downward)),
//                  new Tab(icon: new Icon(Icons.arrow_back)),
//                  new Tab(icon: new Icon(Icons.arrow_back)),
//                  new Tab(icon: new Icon(Icons.arrow_back)),
//                ]
//            )
//        ),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new pizzaShow.PizzaShow(),
              new snacksShow.SnacksShow(),
              new coffeeShow.CoffeeShow(),
              new alcoholShow.AlcoholShow(),
              new burgerShow.BurgerShow(),
            ]
        ),

        bottomNavigationBar: Container(
        height: 50.0,
        child: RaisedButton(
          child: Text(
            "Make A Reservation",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Theme.of(context).accentColor,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}