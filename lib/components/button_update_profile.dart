import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/profile_screen.dart';

class UpdateProfile extends StatelessWidget {
  final Function()? onTap;
  const UpdateProfile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
                },
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 10),//espacio entre el borde y el boton
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Update',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
    );
  }
}