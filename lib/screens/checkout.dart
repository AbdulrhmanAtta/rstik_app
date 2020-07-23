import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rstikapp/models/cart.dart';
import 'package:rstikapp/util/foods.dart';
import 'package:rstikapp/widgets/cart_item.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';


class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  final TextEditingController _couponlControl = new TextEditingController();

  void pay(){
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-77Al5H9PTIkJnO8Ev0eTtg');
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _cardnonceRequestSuccess,
      onCardEntryCancel: _cardEntryCancel,
    );
  }

  void _cardEntryCancel(){
    // Nothing
  }

  void _cardnonceRequestSuccess(CardDetails result){

    print('Nonce: ' + result.nonce);
    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  void _cardEntryComplete(){
    // successful charged
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child){
      return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).accentColor,
            ),
            onPressed: ()=>Navigator.pop(context),
          ),
        ],
      ),

      body: cart.basketItems.length == 0
                ? Center(child: Text('No Items in to checkout', style: TextStyle(color: Colors.white, fontSize: 20.0,)),)
                : Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,130),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
////                Text(
////                  "EDIT",
////                  style: TextStyle(
////                    fontSize: 15,
////                    fontWeight: FontWeight.w400,
////                  ),
////                ),
//
//                IconButton(
//                  onPressed: (){},
//                  icon: Icon(
//                    Icons.edit,
//                  ),
//                ),
//              ],
//            ),
//            SizedBox(height: 10.0),
//            ListTile(
//              title: Text(
//                "John Doe",
//                style: TextStyle(
////                    fontSize: 15,
//                  fontWeight: FontWeight.w900,
//                ),
//              ),
//              subtitle: Text("1278 Loving Acres Road Kansas City, MO 64110"),
//            ),
//
            SizedBox(height: 10.0),

            Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),

            Container(
              child: ListTile(
                title: RaisedButton(
                  onPressed: (){
                    pay();
                  },
                  color: Colors.red.shade400,
                  child: Text("Add Card", style: TextStyle(color: Colors.white),),
                ),
                // Text("John Doe"),
                // subtitle: Text(
                //   "5506 7744 8610 9638",
                //   style: TextStyle(
                //     fontSize: 13,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
                leading: Icon(
                  FontAwesomeIcons.creditCard,
                  size: 50.0,
                  color: Theme.of(context).accentColor,
                ),
                trailing: IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.arrow_forward,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.0),

            Text(
              "Items",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: cart.basketItems == null ? 0 :cart.basketItems.length,
              itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                // Map food = foods[index];
//                print(foods);
//                print(foods.length);
                return CartItem(
                 img: cart.basketItems[index].img,
              isFav: false,
              name: cart.basketItems[index].title,
              price: cart.basketItems[index].price,
                );
              },
            ),
          ],
        ),
      ),

      bottomSheet: Container(
        
        child: Container(

          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey[200],),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200],),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Coupon Code",
                      prefixIcon: Icon(
                        Icons.redeem,
                        color: Theme.of(context).accentColor,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    maxLines: 1,
                    controller: _couponlControl,
                  ),
                ),
              ),

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
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        Text(
                          "${cart.totalPrice}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).accentColor,
                          ),
                        ),

                        Text(
                          "Delivery charges included",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(5,5,10,5),
                    width: 150.0,
                    height: 50.0,
                    child: FlatButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Place Order".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: (){},
                    ),
                  ),

                ],
              ),
            ],
          ),
          height: 130,
        ),
      ),
    );
    },); }
}
