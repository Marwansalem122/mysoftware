
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysoftwareproject/features/Splash/presentation/widgets/splashbody.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../../../core/constant.dart';


class SplashView extends StatelessWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor,
      body: splashbody(),
    );
  }
}