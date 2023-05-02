import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'comHelper.dart';

class getTextFormField extends StatelessWidget {

  @override
  String? hint;

  TextEditingController? controller;

    IconData? icon;

  bool issecure;

  getTextFormField({this.controller,this.icon,this.issecure=false,this.hint});

  Widget build(BuildContext context) {
    return  Container(
      child:TextFormField(
        validator:(value) {
          if(value?.length==0){
            return "please $hint";
          }
          if(hint=="Enter Email"&& !validatEmail(value!)){
            return "Please Enter Valid Email";
          }
          return null;
        },
        onSaved: (val)=>controller?.text=val!,
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(

            border: OutlineInputBorder(
              // borderRadius: BorderRadius.circular(30)
                borderSide: BorderSide(width: 1,color: Colors.white30)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.white),

            ),
            prefixIcon: Icon(icon),
            hintText: hint,
            labelText: hint
        ),
      ),
    );
  }
}
