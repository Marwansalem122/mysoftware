import 'package:flutter/material.dart';
import 'package:mysoftwareproject/core/constant.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/Homepage.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/signup_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../DatabaseHandel/dbHelper.dart';
import '../../../../../comm/comHelper.dart';
import '../../../../../comm/getTextFormfieldforpassword.dart';
import '../../../../../comm/getTextfoemfield.dart';
import '../../../../../models/UserModel.dart';
class login_body extends StatefulWidget {
  const login_body({Key? key}) : super(key: key);

  @override
  State<login_body> createState() => _login_bodyState();
}

class _login_bodyState extends State<login_body> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  @override
  final _formkey=new GlobalKey<FormState>();
  var dbhelper;
  TextEditingController c1=TextEditingController();
  TextEditingController c2=TextEditingController();
  void initState(){
    super.initState();
    dbhelper=dbHelper();
  }
  Login() async {
    String uid = c1.text;
    String passwd = c2.text;
    if (uid.isEmpty) {
      alertdialog(context, "Please Enter User ID");
    } else if (passwd.isEmpty) {
      alertdialog(context, "Please Enter Password");
    } else {
      await dbhelper.getloginuser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Homepage()),
                    (Route<dynamic> route) => false);
          });
        } else {
          alertdialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(".................$error");
        alertdialog(context, "Error: Login Fail");
      });
    }
  }
  Future setSP(usermodel user) async {
    final SharedPreferences sp = await _pref;
    sp.setString("userid", user.userid!);
    sp.setString("username", user.username!);
    sp.setString("userEmail", user.userEmail!);
    sp.setString("userPassword", user.userPassword!);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor,
      body: Form(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150,bottom: 30,left: 50,right: 50),
                child: Image.asset("assets/imgs/logo.png",width: 150,height: 150,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: 330,
                  child:getTextFormField(hint:"Enter id",icon: Icons.person,controller: c1,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SizedBox(
                  width: 330,
                  child:getTextFormFieldPassword(controller: c2,hint:"Enter password")
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 12),
                child: Row(
                  children: [
                    Text("I havn't account  "),
                    InkWell(onTap: (){
                      Get.to(() => signup_view(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));
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
                    fixedSize: Size(100, 40)
                ) ,child: Text("Submit",style: TextStyle(fontSize: 20,color: Colors.white,),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
