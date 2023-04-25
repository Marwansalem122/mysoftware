import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

// import 'features/Auth/presentation/manger/cubit/auth_cubit.dart';
import 'features/Splash/presentation/splashView.dart';

void main() async {

  runApp(FruitsMarket());
}
class FruitsMarket extends StatelessWidget {
  const FruitsMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
        home: SplashView(),
  
    );
  }
}

