import 'package:flutter/material.dart';
import 'package:mysoftwareproject/core/constant.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/login_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../../../DatabaseHandel/dbHelper.dart';
import '../../../../../comm/comHelper.dart';
import '../../../../../comm/getTextFormfieldforpassword.dart';
import '../../../../../comm/getTextfoemfield.dart';
import '../../../../../models/UserModel.dart';
import '../Homepage.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey=new GlobalKey<FormState>();
  var dbhelper;
  TextEditingController c0=TextEditingController();
  TextEditingController c3=TextEditingController();
  TextEditingController c4=TextEditingController();
  TextEditingController c5=TextEditingController();
  TextEditingController c6=TextEditingController();
  void initState(){
    super.initState();
    dbhelper=dbHelper();
  }
  Signup() async {
    String uid = c0.text;
    String un = c3.text;
    String em = c4.text;
    String pa = c5.text;
    String cpa = c6.text;
    if (formkey.currentState!.validate()) {
      if (validatpassword(pa, cpa)) {
        formkey.currentState?.save();
        usermodel _usermodel = usermodel(uid, un, em, pa);
        await dbhelper.saveData(_usermodel).then((userData) {
          alertdialog(context, "Successfull Save");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => login_view()),
                  (Route<dynamic> route) => false);
        }).catchError((error) {
          print('...................$error');
          alertdialog(context, "Error: Data Save Fail");
        });
      }
      else
        alertdialog(context, "Error!");
    }
  }
    Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: mycolor,
      body: Form(
        key: formkey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 15,left: 50,right: 50),
                child: Image.asset("assets/imgs/logo.png",width: 150,height: 96,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                    width: 330,
                    child: getTextFormField(hint: "Enter id",icon: Icons.person,controller: c0,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  width: 330,
                  child: getTextFormField(hint: "Enter username",icon: Icons.person,controller: c3,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  width: 330,
                  child: getTextFormField(hint: "Enter Email",icon: Icons.email,controller: c4,)
                ),),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  width: 330,
                  child: getTextFormFieldPassword(controller: c5,hint:"Enter Password")
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  width: 330,
                  child: getTextFormFieldPassword(controller: c6,hint:"Enter Confirm Password")
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 5),
                child: Row(
                  children: [
                    Text("I havn an account  "),
                    InkWell(onTap: (){
     Get.to(() => login_view(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));
                    },
                      child: Text("Click here",style: TextStyle(color: Colors.blue),)
                      ,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: TextButton(
                     onPressed: Signup
                    ,style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: Size(100, 40)
                ) ,child: Text("Signup",style: TextStyle(fontSize: 20,color: Colors.white,),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
