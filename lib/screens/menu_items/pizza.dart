import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rstikapp/util/pizzas.dart';
import 'package:rstikapp/widgets/badge.dart';


class Pizza extends StatelessWidget {

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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
        child: new  ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          itemCount: pizza == null?0:pizza.length,
          itemBuilder: (BuildContext context, int index) {
            Map pizzas = pizza[index];
            return ListTile(
              leading: Image(
                image: AssetImage(
                  "${pizzas['img']}",
                ),
              ),
              title: Text("${pizzas['name']}"),
              subtitle: Column(
                children: <Widget>[
                  SizedBox(height: 5.0,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 0.0),
                      Text(
                          "${pizzas["price"]}MYR",
                      ), 
                    ],
                  ),
                ],
              ),
               trailing: IconButton(
                 onPressed: (){},
                 icon: Icon(Icons.add, color: Colors.red[400],),),
            );
          },
        ),
      );
  }
}