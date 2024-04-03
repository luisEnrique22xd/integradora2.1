
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/home_screen.dart';

class Mybutton extends StatelessWidget {

  final Function()? onTap;
  const Mybutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   HomeScreen()),
                );
                },
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 135),//tamaño del boton horizontal
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Sign In',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
    );
  }
}