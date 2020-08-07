import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rstikapp/models/restaurants.dart';
import 'package:rstikapp/screens/dishes.dart';
import 'package:rstikapp/screens/restaurantScreen.dart';
import 'package:rstikapp/widgets/grid_product.dart';
import 'package:rstikapp/widgets/home_category.dart';
import 'package:rstikapp/widgets/slider_item.dart';
import 'package:rstikapp/util/foods.dart';
import 'package:rstikapp/util/categories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:square_in_app_payments/in_app_payments.dart';


Color inactiveColor = Colors.white;
Color activeColor = Colors.red[400];
enum PageTypes {all, popular, liked}

class Home extends StatefulWidget {
  final String name;
  final String img;
  final bool isFav;
  final double rating;
  final int raters;

  Home({
    Key key,
    @required this.name,
    @required this.img,
    @required this.isFav,
    @required this.rating,
    @required this.raters})
      :super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home>{
  
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  int _current = 0;
  Color activeColor;
  Color inactiveColor;
  PageTypes selectedpage;

 

  Future getRestaurants() async{
    var firestore =  Firestore.instance;
    QuerySnapshot qn = await firestore.collection('restaurants').getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(

      body: ListView(
        children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(
//                   "Restaurants",
//                   style: TextStyle(
//                     fontSize: 23,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),

//                 FlatButton(
//                   child: Text(
//                     "View More",
//                     style: TextStyle(
// //                      fontSize: 22,
// //                      fontWeight: FontWeight.w800,
//                       color: Theme.of(context).accentColor,
//                     ),
//                   ),
//                   onPressed: (){
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (BuildContext context){
//                           return DishesScreen();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),

//             SizedBox(height: 10.0),

          //Slider Here

          Container(
            height: MediaQuery.of(context).size.height/2.4,
            child: Image.asset('assets/home.jpg',
            fit: BoxFit.fill,),
          ),
          SizedBox(height: 20.0),

          // Text(
          //   "Categories",
          //   style: TextStyle(
          //     fontSize: 23,
          //     fontWeight: FontWeight.w800,
          //   ),
          // ),
          // SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            RaisedButton(
            disabledColor: Colors.red[400],
            shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, color: Colors.red[400]),
                  borderRadius: BorderRadius.circular(15)),
            child: Text('All', style: TextStyle(fontSize: 15.0, color: Colors.white),),),
            RaisedButton(
              
              disabledColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(15)),
              child: Text('Popular', style: TextStyle(fontSize: 15.0),),),
            RaisedButton(
              disabledColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(15)),
              child: Text('Liked', style: TextStyle(fontSize: 15.0),),),
          ],),
          // RaisedButton(
          //   // width: MediaQuery.of(context).size.width,
          //   child: Center(
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal, 
          //       shrinkWrap: true,
          //       itemCount: categories == null?0:categories.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         Map cat = categories[index];
          //         return HomeCategory(
          //           title: cat['name'],
          //           isHome: true,
          //         );
          //       },
          //     ),
          //   ),
          // ),

          SizedBox(height: 20.0),

          Padding(
            padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Restaurants",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){},
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),

          Padding(
            padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
            child: FutureBuilder(
              future: getRestaurants(),
              builder: (_, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: Text('Loading....'));
                } else {
                  return GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.25),
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (_,index) {
//                Food food = Food.fromJson(foods[index]);
                   Map food = foods[index];
//                print(foods);
//                print(foods.length);
                  return GridProduct(
                    img: food['img'],
                    isFav: false,
                    name: snapshot.data[index].data["name"],
                    rating: 5.0,
                    raters: 23,
                    onTap: (){ Navigator.of(context).push(
        MaterialPageRoute(
              builder: (BuildContext context){
                return ProductDetails(name: snapshot.data[index].data["name"], img: food['img'], email: snapshot.data[index].data["email"],);} 
                      ), 
                    );
                  },
                );
              },
        );
      
                }
              },
            ),
          ),

          SizedBox(height: 30),

          // Container(
          //   child: restaurantsList.length == 0 ? new Text('No data') : 
          //   ListView.builder(itemCount: restaurantsList == null ? 0 :restaurantsList.length,
          //   itemBuilder: (BuildContext context, int index){
          //     return Text('$restaurantsList');
          //   }) ,
          // ),

        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
