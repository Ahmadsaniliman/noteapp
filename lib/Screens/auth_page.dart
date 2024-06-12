import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstnotebook/Screens/home.dart';
import 'package:myfirstnotebook/Screens/login.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final bool isEmail = FirebaseAuth.instance.currentUser!.emailVerified;

  @override
  Widget build(BuildContext context) {
    if (isEmail == true) {
      return HomePage();
    } else {
      return LoginScreen();
    }
  }
}
