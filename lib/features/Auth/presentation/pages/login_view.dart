import 'package:flutter/material.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/widgets/login_body.dart';

class login_view extends StatefulWidget {
  const login_view({Key? key}) : super(key: key);

  @override
  State<login_view> createState() => _login_viewState();
}

class _login_viewState extends State<login_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: login_body(),
    );
  }
}
