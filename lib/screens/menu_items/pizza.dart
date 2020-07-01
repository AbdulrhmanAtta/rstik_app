import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rstikapp/models/cart.dart';
import 'package:rstikapp/models/item.dart';
import 'package:rstikapp/util/pizzas.dart';
import 'package:rstikapp/widgets/badge.dart';


class Pizza extends StatelessWidget {

  final List<Item> items = [
    Item(img: "assets/food1.jpeg", title: 'Margrita ', price: 500.0),
    Item(img: "assets/food1.jpeg", title: 'Margrita ', price: 500.0),
    Item(img: "assets/food1.jpeg", title: 'Margrita ', price: 500.0),
  ];

  final String name;
  final String img;
  final bool isFav;
  final double price;
  final int raters;


  Pizza({
    Key key,
    @required this.name,
    @required this.img,
    @required this.isFav,
    @required this.price,
    @required this.raters})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
        child: new  ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items == null?0:items.length,
          itemBuilder: (BuildContext context, int index) {
            // Map item = items[index];
            return ListTile(
              leading: Image(
                image: AssetImage(
                  "${items[index].img}",
                ),
              ),
              title: Text("${items[index].title}"),
              subtitle: Column(
                children: <Widget>[
                  SizedBox(height: 5.0,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 0.0),
                      Text(
                          "${items[index].price}MYR",
                      ), 
                    ],
                  ),
                ],
              ),
               trailing: IconButton(
                 onPressed: (){
                   cart.add(items[index]);
                 },
                 icon: Icon(Icons.add, color: Colors.red[400],),),
            );
          },
        ),
      );
    },); }
}