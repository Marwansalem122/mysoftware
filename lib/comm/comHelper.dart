import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void alertdialog(BuildContext context, String message) {
  Fluttertoast.showToast(msg: message,backgroundColor: Colors.green,textColor: Colors.white);
}
validatEmail(String email){
  final RegExp emailReg= RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]"
      r"(?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$"
  );
 if( emailReg.hasMatch(email)){
   return true;
 }
 else return false;
}
validatpassword(String p,String cp){
  if(p==cp)
    return true;
  else
    return false;
}