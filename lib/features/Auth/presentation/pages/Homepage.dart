
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysoftwareproject/core/constant.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
        child:  ListView(
          children: [

            Container(
              //width: 100,
              margin: EdgeInsets.fromLTRB(20,20, 20, 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 10),
              child: Row(
                children: [
                  Text("Organic Fruits",style: TextStyle(fontSize: 20),),
                  SizedBox(width: 30,),
                  Text("(20% Off)",style: TextStyle(fontSize: 20,color: Colors.green),)
                ],
              )
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,
                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/strawberry.jpg",width: 200,height: 130,),
                        ),
                        Text("Strawberry"),
                        SizedBox(height: 10,),
                        Text("5\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/orange.jpg",width: 200,height: 130,),
                        ),
                        Text("Orange"),
                        SizedBox(height: 10,),
                        Text("3\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/cherry.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Strawberry"),
                        SizedBox(height: 10,),
                        Text("7\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/avocado.jpg",width: 200,height: 130,),
                        ),
                        Text("Avocado"),
                        SizedBox(height: 10,),
                        Text("10\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/mango.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Mango"),
                        SizedBox(height: 10,),
                        Text("10\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/apricot.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Peach"),
                        SizedBox(height: 10,),
                        Text("2.5\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/pomegranate.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("pomegranate"),
                        SizedBox(height: 10,),
                        Text("5.5\$  Per/Kg")
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10),
                child: Row(
                  children: [
                    Text("Mixed Fruit Pack",style: TextStyle(fontSize: 20),),
                    SizedBox(width: 30,),
                    Text("(10% Off)",style: TextStyle(fontSize: 20,color: Colors.green),)
                  ],
                )
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,
                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/apple and strawberry.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Apple and Strawberry"),
                        SizedBox(height: 10,),
                        Text("16\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/mixed.webp",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Orange"),
                        SizedBox(height: 10,),
                        Text("32\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/fruitssmal.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Mixed Small"),
                        SizedBox(height: 10,),
                        Text("11\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/mixedmeduim.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("mixed meduim"),
                        SizedBox(height: 10,),
                        Text("21\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/fruit/download.jpeg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Large Max"),
                        SizedBox(height: 10,),
                        Text("55\$  Per/Kg")
                      ],
                    ),
                  ),


                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10),
                child: Row(
                  children: [
                    Text("Vegetables",style: TextStyle(fontSize: 20),),
                    SizedBox(width: 30,),
                    Text("(5% Off)",style: TextStyle(fontSize: 20,color: Colors.green),)
                  ],
                )
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,
                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/vegetable/Bell_pepper.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Bell pepper"),
                        SizedBox(height: 10,),
                        Text("3\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/vegetable/Turnips.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Turnips"),
                        SizedBox(height: 10,),
                        Text("2\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/vegetable/Onion.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Onion"),
                        SizedBox(height: 10,),
                        Text("4\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/vegetable/Potato.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Potato"),
                        SizedBox(height: 10,),
                        Text("7\$  Per/Kg")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17),
                    width: 100,height: 200,

                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.asset("assets/imgs/vegetable/Zucchini.jpg",fit: BoxFit.fill,width: 200,height: 130,),
                        ),
                        Text("Large Max"),
                        SizedBox(height: 10,),
                        Text("55\$  Per/Kg")
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
