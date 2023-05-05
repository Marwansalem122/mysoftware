import 'package:flutter/material.dart';
import 'package:mysoftwareproject/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../DatabaseHandel/dbHelper.dart';
import 'package:path/path.dart';

import '../../../../comm/comHelper.dart';
class useradmin extends StatefulWidget {
  const useradmin({Key? key}) : super(key: key);

  @override
  State<useradmin> createState() => _useradminState();
}

class _useradminState extends State<useradmin> {
  Future<SharedPreferences>_pref=SharedPreferences.getInstance();
  List<Map<String, dynamic>> _users = [];
   var  dbhelper;
  @override
  void initState() {
    super.initState();
    dbhelper=dbHelper();
    _getUsers();
  }

  Future<void> _getUsers() async {
    final users = await dbhelper.getAllUsers();
    setState(() {
      _users = users!;
    });
  }
  Delete( String? uidd)async{

    usermodel us=usermodel("0", "0", "0", "0");
    await dbhelper?.deleteUser(uidd).then((value){
      if(value==1) {
        alertdialog(context as BuildContext, "Successfull Delete");
        updateSP(us, false).whenComplete((){} );
      }
    });

  }

  Future updateSP(usermodel user,bool add) async {
    final SharedPreferences sp = await _pref;
    if(add&&user.userid!="0"){
      sp.setString("userid", user.userid!);
      sp.setString("username", user.username!);
      sp.setString("userEmail", user.userEmail!);
      sp.setString("userPassword", user.userPassword!);
    }else{
      sp.remove("userid");
      sp.remove("username");
      sp.remove("userEmail");
      sp.remove("userPassword");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("User Admin"),
        centerTitle: true,

      ),
      body:ListView.builder(
    itemCount: _users.length,
    itemBuilder: (BuildContext context, int index) {
    final user = _users[index];
    return ListTile(
    title: Text(user['userid']),
    trailing:  InkWell(
      onTap: Delete(user['userid']),
    ),
    subtitle: Text(user['userEmail']),
    );
    },
      ),
    );
  }
}