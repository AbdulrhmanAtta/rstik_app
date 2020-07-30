import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rstikapp/models/cart.dart';
import 'package:rstikapp/screens/checkout.dart';
import 'package:rstikapp/util/foods.dart';
import 'package:rstikapp/widgets/cart_item.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with AutomaticKeepAliveClientMixin<CartScreen >{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<Cart>(builder: (context, cart, child){
      return Scaffold(
      body: cart.basketItems.length == 0
                ? Center(child: Text('No Items in your cart', style: TextStyle(color: Colors.white, fontSize: 20.0,)),)
                : Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,8.0,0),
        child: ListView.builder(
          itemCount: cart.basketItems == null ? 0 :cart.basketItems.length,
          itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
//                print(foods);
//                print(foods.length);  
            return CartItem(
              img: cart.basketItems[index].img,
              isFav: false,
              name: cart.basketItems[index].title,
              price: cart.basketItems[index].price,
              removeIcon: (){cart.remove(cart.basketItems[index]);},
            );
          },
        ),
      ),

       bottomSheet: Card(
        elevation: 4.0,
        child: Container(

          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.fromLTRB(10,5,5,5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8.0,),
                        Text(
                          "${cart.totalPrice}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        SizedBox(height: 8.0,),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          height: 90,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: "Checkout",
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return Checkout();
              },
            ),
          );
        },
        child: Icon(
          Icons.arrow_forward,
        ),
        heroTag: Object(),
      ),
    );
    },); }

  @override
  bool get wantKeepAlive => true;
}

