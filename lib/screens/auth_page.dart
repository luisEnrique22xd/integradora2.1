import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:integradora2_1/screens/login_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return  const HomeScreen();//user is logged in
          }
          else{
            return const LoginScreen();//user is not logged
          }
        }
        ),
    );
  }
}