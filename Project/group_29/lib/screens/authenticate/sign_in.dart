import 'package:flutter/material.dart';
import 'package:group_29/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In To Group29'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
            child: Text('Sign In With Email & Password'),
            onPressed: () async {
              dynamic result =
                  await _auth.signInEmailAndPassword(email: '', password: '');
              if (result == null) {
                print('error signing in');
              } else {
                print('signed in');
                print(result);
              }
            }),
      ),
    );
  }
}
