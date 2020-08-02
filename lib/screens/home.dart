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


class Home extends StatefulWidget {
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

  List<Restaurant> restaurantsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    DatabaseReference restRef = FirebaseDatabase.instance.reference();

    restRef.child('restaurant').once().then((DataSnapshot snap){

      var keys = snap.value.keys;
      var data = snap.value;

      restaurantsList.clear();

      for(var key in keys){
        
        Restaurant rest = new Restaurant
        (
          data[key]['key'],
          data[key]['image'],
          data[key]['name'],
          data[key]['description'],

        );

        restaurantsList.add(rest);

      }

      setState(() {

        print('Length : $restaurantsList.length');
       
      }); 

      InAppPayments.setSquareApplicationId('sandbox-sq0idb-77Al5H9PTIkJnO8Ev0eTtg');

    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
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

//             //Slider Here

//             CarouselSlider(
//               height: MediaQuery.of(context).size.height/2.4,
//               items: map<Widget>(
//                 foods,
//                     (index, i){
//                       Map food = foods[index];
//                   return SliderItem(
//                     img: food['img'],
//                     isFav: false,
//                     name: food['name'],
//                     rating: 5.0,
//                     raters: 23,
//                   );
//                 },
//               ).toList(),
//               autoPlay: true,
// //                enlargeCenterPage: true,
//               viewportFraction: 1.0,
// //              aspectRatio: 2.0,
//               onPageChanged: (index) {
//                 setState(() {
//                   _current = index;
//                 });
//               },
//             ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Expanded(
                  child: FlatButton(
                  shape: RoundedRectangleBorder(side: BorderSide( width: 0.5)),
                  child: Text('All', style: TextStyle(fontSize: 15.0),),),
              ),
              Expanded(child: FlatButton(
                shape: RoundedRectangleBorder(side: BorderSide( width: 0.5)),
                child: Text('Popular', style: TextStyle(fontSize: 15.0),),)),
              Expanded(
                child: FlatButton(
                  shape: RoundedRectangleBorder(side: BorderSide( width: 0.5)),
                  child: Text('Nearby', style: TextStyle(fontSize: 15.0),),)),
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

            Row(
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
            SizedBox(height: 10.0),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: restaurantsList == null ? 0 :restaurantsList.length,
              itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                 Map food = foods[index];
//                print(foods);
//                print(foods.length);
                return GridProduct(
                  img: food['img'],
                  isFav: false,
                  name: restaurantsList[index].name,
                  rating: 5.0,
                  raters: 23,
                  onTap: (){ Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context){
              return ProductDetails(name: restaurantsList[index].name, img: food['img'],);} 
                    ), 
                  );
                },
              );
            },
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
