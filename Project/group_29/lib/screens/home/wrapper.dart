import 'dart:html';
import 'package:group_29/screens/authenticate/authenticate.dart';
import 'package:group_29/screens/authenticate/sign_in.dart';
import 'package:group_29/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}
