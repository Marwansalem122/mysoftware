import 'package:flutter/material.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/widgets/signup_body.dart';

class signup_view extends StatelessWidget {
  const signup_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}
