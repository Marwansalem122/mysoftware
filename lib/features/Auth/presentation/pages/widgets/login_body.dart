import 'package:flutter/material.dart';
import 'package:mysoftwareproject/core/constant.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/Homepage.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/signup_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class login_body extends StatefulWidget {
  const login_body({Key? key}) : super(key: key);

  @override
  State<login_body> createState() => _login_bodyState();
}

class _login_bodyState extends State<login_body> {
  bool pass=true;
  var ic=Icon(Icons.visibility_off);
  @override
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
              padding: const EdgeInsets.only(top: 150,bottom: 30,left: 50,right: 50),
              child: Image.asset("assets/imgs/logo.png",width: 150,height: 150,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                width: 330,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
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
              padding: const EdgeInsets.only(left: 20,bottom: 12),
              child: Row(
                children: [
                  Text("I havn't account  "),
                  InkWell(onTap: (){
                    Get.to(() => signup_view(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));

                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup()));
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
              ) ,child: Text("Submit",style: TextStyle(fontSize: 20,color: Colors.white,),)),
            )
          ],
        ),
      ),
    );
  }
}
