import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rstikapp/util/burgers.dart';


class Burger extends StatelessWidget {

  final String name;
  final String img;
  final bool isFav;
  final double price;
  final int raters;


  Burger({
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
        itemCount: burger == null?0:burger.length,
        itemBuilder: (BuildContext context, int index) {
          Map burgers = burger[index];
          return ListTile(
            leading: Image(
              image: AssetImage(
                "${burgers['img']}",
              ),
            ),

            title: Text("${burgers['name']}"),
            subtitle: Column(
              children: <Widget>[
                SizedBox(height: 5.0,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 0.0),
                    Text(
                      "${burgers["price"]}MYR",
                    ),
                  ],
                ),

                SizedBox(height: 7.0),
              ],
            ),
            trailing: IconButton(
                 onPressed: (){},
                 icon: Icon(Icons.add_circle, color: Colors.red[400],),),
          );
        },
      ),
    );
  }
}