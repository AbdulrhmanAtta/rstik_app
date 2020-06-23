import 'package:flutter/material.dart';
import 'package:rstikapp/screens/checkout.dart';
import 'package:rstikapp/widgets/badge.dart';
import 'menu_items/pizza.dart' as pizza;
import 'menu_items/alcohols.dart' as alcohol;
import 'menu_items/burgers.dart' as burger;
import 'menu_items/snack.dart' as snack;
import 'menu_items/coffee.dart' as coffee;
import 'notifications.dart';

class Menu extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<Menu> with SingleTickerProviderStateMixin {


  TabController controller;

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
              new pizza.Pizza(),
              new snack.Snack(),
              new coffee.Coffee(),
              new alcohol.Alcohol(),
              new burger.Burger(),
            ]
        ),

        bottomNavigationBar: Container(
        height: 50.0,
        child: RaisedButton(
          child: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Theme.of(context).accentColor,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Checkout()),
            );
          },
        ),
      ),
    );
  }
}
