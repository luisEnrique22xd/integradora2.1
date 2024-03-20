
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/home_screen.dart';

class MybuttonReport extends StatelessWidget {

  final Function()? onTap;
  const MybuttonReport({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()),
                );
                },
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 120),//tamaño del boton horizontal
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Create report',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
    );
  }
}