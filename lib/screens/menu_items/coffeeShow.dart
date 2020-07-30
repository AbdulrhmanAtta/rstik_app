import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rstikapp/util/coffees.dart';


class CoffeeShow extends StatelessWidget {

  final String name;
  final String img;
  final bool isFav;
  final double price;
  final int raters;


  CoffeeShow({
    Key key,
    @required this.name,
    @required this.img,
    @required this.isFav,
    @required this.price,
    @required this.raters})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
      child: new  ListView.builder(
        shrinkWrap: true,
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        itemCount: coffee == null?0:coffee.length,
        itemBuilder: (BuildContext context, int index) {
          Map coffees = coffee[index];
          return ListTile(
            leading: Image(
              image: AssetImage(
                "${coffees['img']}",
              ),
            ),

            title: Text("${coffees['name']}"),
            subtitle: Column(
              children: <Widget>[
                SizedBox(height: 5.0,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 0.0),
                    Text(
                      "${coffees["price"]}MYR",
                    ),
                  ],
                ),

                SizedBox(height: 7.0),
              ],
            ),
            
          );
        },
      ),
    );
  }
}