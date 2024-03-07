
import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {

  final Function()? onTap;
  const Mybutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),//espacio entre el boton y el borde
        margin: const EdgeInsets.symmetric(horizontal: 25),//espacio del texto y del boton
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(8)),//border
        child: const Center(
          child: Text('Sign In',
          style: TextStyle(color: Colors.black),),
          ),
      ),
    );
  }
}