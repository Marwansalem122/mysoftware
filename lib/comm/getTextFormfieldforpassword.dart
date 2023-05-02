import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class getTextFormFieldPassword extends StatefulWidget {
  String? hint;

  TextEditingController? controller;

  var icon=Icon(Icons.visibility);

  bool issecure=true;

  getTextFormFieldPassword({this.controller,this.hint});
  @override
  State<getTextFormFieldPassword> createState() => _getTextFormFieldPasswordState();
}

class _getTextFormFieldPasswordState extends State<getTextFormFieldPassword> {
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (val)=>val?.length==0?"please ${widget.hint}":null,
        onSaved: (val)=>widget.controller?.text=val!, controller: widget.controller,
        style: TextStyle(color: Colors.black),
        obscureText: widget.issecure,
        decoration: InputDecoration(

            border: OutlineInputBorder(
              // borderRadius: BorderRadius.circular(30)
                borderSide: BorderSide(width: 1,color: Colors.white30)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.white),

            ),
            prefixIcon: Icon(Icons.password),
            hintText: widget.hint,
            labelText: widget.hint,
            suffixIcon: InkWell(onTap: (){
              setState(() {
                widget.issecure=!widget.issecure;
                if(widget.issecure==false){
                  widget.icon=Icon(Icons.visibility);
                }
                else {
                  widget.icon=Icon(Icons.visibility_off);
                }
              });
            },child: widget.icon,)
        ),
      ),
    );
  }
}
