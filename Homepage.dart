
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysoftwareproject/core/constant.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/cartpage.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/imodles/cart.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/page1.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/page2.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/page3.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/page4.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static const List<Widget> _screens = [    page1(),    page2(),    page3(), page4() ];
  GlobalKey<ScaffoldState>st=new GlobalKey<ScaffoldState>();
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
    return Consumer<Cart>(
        builder: (context,cart,chil){
       return   Scaffold(
            key: st,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton (onPressed: (){
                st.currentState!.openEndDrawer();
              },icon: Icon(Icons.menu), ),
              title:Text(" Fruit Market",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),) ,
              centerTitle: true,
              backgroundColor: mycolor,



              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(onTap: (){},child: Icon(Icons.notifications),),
                )
              ],
            ),
            endDrawer: Drawer(
              child: ListView(
                padding:EdgeInsets.zero ,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text('Put Email'),
                    accountEmail: Text('Put acc'),
                    currentAccountPicture:CircleAvatar (
                        child:ClipOval(
                            child: Image.network(
                              "https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/342781106_1579211862599095_1442454918106655396_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFJmspGqu7jxepA60PCIGDZhQI7FZ-asB-FAjsVn5qwH5ya4R-Oz60f9DwssZ63Og9MXBGFy53kMtzfOEvcCrMx&_nc_ohc=0m1Z1Gc7TJEAX-hallE&_nc_ht=scontent.faly1-2.fna&oh=00_AfA76wdfqSh1Bwq5mnQjnrGtIuyJrvIyPWh7o2mc_UHyIg&oe=6457F5A0",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,)
                        )
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image:DecorationImage(
                          image: NetworkImage(
                            '',
                          ),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite,color: Colors.green),
                    title:Text("Favorites",),
                    onTap: ()=>print("object"),
                  ),
                  ListTile(
                    leading: Icon(Icons.backpack_rounded,color: Colors.green),
                    title:Text("My orders",),
                    onTap: ()=>print("object"),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_cart,color: Colors.green),
                    title:Text("My Cart",),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>CheckoutPage()));
                    },
                    subtitle: Text(cart.count.toString()
                      ,style: TextStyle(color: Colors.red),),
                  ),Divider(),
                  ListTile(
                    leading: Icon(Icons.star_sharp,color: Colors.green),
                    title:Text("Rate Us",),
                    onTap: ()=>print("object"),
                  ),
                  ListTile(
                    leading: Icon(Icons.share,color: Colors.green),
                    title:Text("Refer a Friend",),
                    onTap: ()=>print("object"),
                  ),Divider(),
                  ListTile(
                    leading: Icon(Icons.settings,color: Colors.green),
                    title:Text("Settings",),
                    onTap: ()=>print("object"),
                  ),
                  ListTile(
                    leading: Icon(Icons.help,color: Colors.green),
                    title:Text("Help",),
                    onTap: ()=>print("object"),
                  ),Divider(),
                  ListTile(
                    leading: Icon(Icons.logout,color: Colors.green),
                    title:Text("Log Out",),
                    onTap: ()=>print("object"),
                  ),
                ],
              ),
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
            body:Container(
                child:  _screens[index1]

            ),
          );
        },
    ) ;

  }
}
