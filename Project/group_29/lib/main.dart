import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:group_29/screens/authenticate/sign_in.dart';
import 'package:group_29/screens/home/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group 29',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Group 29")),
        body: Wrapper(),
      ),
    );
  }
}
