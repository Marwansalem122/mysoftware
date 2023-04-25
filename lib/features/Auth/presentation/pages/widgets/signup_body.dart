import 'package:flutter/material.dart';
import 'package:mysoftwareproject/core/constant.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/login_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Homepage.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  bool pass=true;
  bool pass2=true;
  var ic=Icon(Icons.visibility_off);
  var ic2=Icon(Icons.visibility_off);

  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: mycolor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40,bottom: 30,left: 50,right: 50),
              child: Image.asset("assets/imgs/logo.png",width: 150,height: 150,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: 330,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(

                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30)
                          borderSide: BorderSide(width: 1,color: Colors.white30)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.white),

                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter Username"
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: 330,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30)
                          borderSide: BorderSide(width: 1,color: Colors.white30)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.white),

                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter Email"
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: 330,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  obscureText: pass,
                  decoration: InputDecoration(

                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30)
                          borderSide: BorderSide(width: 1,color: Colors.white30)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.white),

                      ),
                      prefixIcon: Icon(Icons.password),
                      hintText: "Enter password",
                      suffixIcon: InkWell(onTap: (){
                        setState(() {
                          pass=!pass;
                          if(pass==false){
                            ic=Icon(Icons.visibility);
                          }
                          else {
                            ic=Icon(Icons.visibility_off);
                          }
                        });
                      },child: ic,)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: 330,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  obscureText: pass2,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(

                        // borderRadius: BorderRadius.circular(30)
                          borderSide: BorderSide(width: 1,color: Colors.white30)
                      ),
                      prefixIcon: Icon(Icons.password),
                      hintText: "Enter confirmed password",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.white),

                      ),
                      suffixIcon: InkWell(onTap: (){
                        setState(() {
                          pass2=!pass2;
                          if(pass2==false){
                            ic2=Icon(Icons.visibility);
                          }
                          else {
                            ic2=Icon(Icons.visibility_off);
                          }
                        });
                      },child: ic2,)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 12),
              child: Row(
                children: [
                  Text("I havn an account  "),
                  InkWell(onTap: (){
 Get.to(() => login_view(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));

                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
                  },
                    child: Text("Click here",style: TextStyle(color: Colors.blue),)
                    ,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: TextButton(
                  onPressed: (){
                    Get.to(() => Homepage(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));
                  },style: TextButton.styleFrom(

                  backgroundColor: Colors.green,
                  // primary: Colors.white,
                  fixedSize: Size(100, 40)
              ) ,child: Text("Signup",style: TextStyle(fontSize: 20,color: Colors.white,),)),
            )
          ],
        ),
      ),
    );
  }
}
