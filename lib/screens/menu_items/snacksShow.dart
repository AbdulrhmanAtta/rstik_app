import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rstikapp/util/snacks.dart';


class SnacksShow extends StatelessWidget {

  final String name;
  final String img;
  final bool isFav;
  final double price;
  final int raters;


  SnacksShow({
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
        itemCount: snack == null?0:snack.length,
        itemBuilder: (BuildContext context, int index) {
          Map snacks = snack[index];
          return ListTile(
            leading: Image(
              image: AssetImage(
                "${snacks['img']}",
              ),
            ),

            title: Text("${snacks['name']}"),
            subtitle: Column(
              children: <Widget>[
                SizedBox(height: 5.0,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 0.0),
                    Text(
                      "${snacks["price"]}MYR",
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