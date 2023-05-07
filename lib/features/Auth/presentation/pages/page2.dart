import 'package:flutter/material.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/imodles/item.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/imodles/cart.dart';
import 'package:provider/provider.dart';

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
 final List<Item>fruits=[
   Item(title: "Apple",price: 1.25),
   Item(title: "Strawberries",price: 1.25),
   Item(title: "Apricot",price: 1.25),
   Item(title: "Avocado",price: 1.25),
   Item(title: "Bananas",price: 1.25),
   Item(title: "Cherries",price: 1.25),
   Item(title: "Lemons",price: 1.25),
   Item(title: "Mangos",price: 1.25),
   Item(title: "Oranges",price: 1.25),
   Item(title: "Pomegranate",price: 1.25),
   Item(title: "Raspberries",price: 1.25),
   Item(title: "Watermelons",price: 1.25),
   Item(title: "Tomatoes",price: 1.25),
   Item(title: "Peaches",price: 1.25),
   Item(title: "Dates",price: 1.25),
   Item(title: "Clementine",price: 1.25),
   Item(title: "Kiwi",price: 1.25),
 ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child){
    return Scaffold(
      body: Container(
        child: ListView.builder(
        itemBuilder: (context,index){
          return ListTile(
            title: Text(fruits[index].title!),
            trailing: Icon(Icons.add),
            onTap:(){
              cart.add(fruits[index]);
            } ,
          );
        },
        itemCount: fruits.length,
        ),
      ),

    );
    },
    );
  }
}
