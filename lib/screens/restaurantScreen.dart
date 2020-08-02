import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rstikapp/screens/menu.dart';
import 'package:rstikapp/screens/menuShow.dart';
import 'package:rstikapp/screens/notifications.dart';
import 'package:rstikapp/util/comments.dart';
import 'package:rstikapp/util/const.dart';
import 'package:rstikapp/util/foods.dart';
import 'package:rstikapp/widgets/badge.dart';
import 'package:rstikapp/widgets/smooth_star_rating.dart';

class ProductDetails extends StatefulWidget {

  final String name;
  final String img;
  final bool isFav;
  final double rating;
  final int raters;


  ProductDetails({
    Key key,
    @required this.name,
    @required this.img,
    @required this.isFav,
    @required this.rating,
    @required this.raters})
      :super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(name, img, isFav, rating, raters);
}

class _ProductDetailsState extends State<ProductDetails> {

  String name;
  String img;
  double rating;
  int raters;
  bool isFav = false;

  _ProductDetailsState(name, img, rating, raters, isFav);

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
          "Item Details",
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

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          
          children: <Widget>[
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "${foods[1]['img']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  right: -10.0,
                  bottom: 3.0,
                  child: RawMaterialButton(
                    onPressed: (){},
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        isFav
                            ?Icons.favorite
                            :Icons.favorite_border,
                        color: Colors.red,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.0),

            Text(
              
              "$name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Row(
                children: <Widget>[
                  SmoothStarRating(
                    starCount: 5,
                    color: Constants.ratingBG,
                    allowHalfRating: true,
                    rating: 5.0,
                    size: 10.0,
                  ),
                  SizedBox(width: 10.0),

                  Text(
                    "5.0 (23 Reviews)",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  SizedBox(width: 100.0),
                  Expanded(
                    child: Container(
                      height: 35.0,
                      child: RaisedButton(
                        child: Text(
                            "MENU",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MenuShow()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: 20.0),

            Text(
              "ADDRESS:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),

            SizedBox(height: 10.0),

            Text(
              "One South, Seri Kembangan 23300, Kuala Lumpur, Malaysia",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),

            SizedBox(height: 20.0),

            Text(
              "Reviews",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 20.0),
            
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: comments == null?0:comments.length,
              itemBuilder: (BuildContext context, int index) {
                Map comment = comments[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(
                      "${comment['img']}",
                    ),
                  ),

                  title: Text("${comment['name']}"),
                  subtitle: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SmoothStarRating(
                            starCount: 5,
                            color: Constants.ratingBG,
                            allowHalfRating: true,
                            rating: 5.0,
                            size: 12.0,
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            "February 14, 2020",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 7.0),
                      Text(
                        "${comment["comment"]}",
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 10.0),
          ],
        ),
      ),



      bottomNavigationBar: Container(
        height: 50.0,
        child: RaisedButton(
          child: Text(
            "MAKE A RESERVATION",
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
}
