// // Get username and password from the user.Pass the data to 
// // helper method

// import 'package:group_29/services/auth.dart';

// AuthService()
//    .signUp(email: email, password: password)
//    .then((result) {
//     	if (result == null) {
//         Navigator.pushReplacement(context,
//            MaterialPageRoute(builder: (context) => Home()));
//        } else {
//           Scaffold.of(context).showSnackBar(SnackBar(
//           content: Text(
//               result,
//               style: TextStyle(fontSize: 16),
//              ),
//           ));
//        }
//   });