
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/register_now.dart';

class MybuttonAddAcc extends StatelessWidget {

  final Function()? onTap;
  const MybuttonAddAcc({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const RegisterNow()),
                );
                },
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 100),//espacio entre el borde y el boton
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Add another account',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
    );
  }
}