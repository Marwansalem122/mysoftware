
import 'package:flutter/material.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/imodles/cart.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child){
        return Scaffold(
          appBar: AppBar(
            title: Row(children:[
              Text( "My Cart "),
              Text("("+cart.count.toString()+" items)   ",style: TextStyle(fontSize: 17),),
              Text(cart.totalprice.toString(),style: TextStyle(fontSize: 17),),
              Text("EGP",style: TextStyle(fontSize: 10),)
              
            ]
        ),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
            body: cart.basketItems.length == 0
                ? Text('no items in your cart')
                : ListView.builder(
              itemCount: cart.basketItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(cart.basketItems[index].title),
                    subtitle:
                    Text(cart.basketItems[index].price.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        cart.remove(cart.basketItems[index]);
                      },
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}