
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysoftwareproject/core/constant.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/page1.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/page2.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/page3.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/page4.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static const List<Widget> _screens = [    page1(),    page2(),    page3(), page4() ];

  @override
  int index1=0;
  var co= Colors.black26;
  List l=[
    Text('Home ', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Shopping cart', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Favorite', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('My Account', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  void _onItemTapped(int index) {
    setState(() {
      index1 = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
         leading:Center(child: Text(" Fruit Market",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)) ,
         leadingWidth: 100,
        backgroundColor: mycolor,


        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(onTap: (){},child: Icon(Icons.notifications),),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: ('Home'),
             icon:Icon(Icons.home),

          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.shopping_cart_outlined),
            label:"Shopping cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label:"Favorite",
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.person_4,),
            label:"My Account",
          ),

        ],
        currentIndex:index1 ,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black26,

      ),
      body: Container(
        child:  _screens[index1]

        ),
      );

  }
}
