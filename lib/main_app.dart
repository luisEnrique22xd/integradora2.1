import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/auth_page.dart';
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      //home:  RegisterNow(),
    );
  }
}
