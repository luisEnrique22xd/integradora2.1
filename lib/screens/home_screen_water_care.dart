import 'package:flutter/material.dart';

class HomeScreenWater extends StatelessWidget {
  const HomeScreenWater({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Care'),
      ),
      body: const Column(
        children: [
           Image(
                image: AssetImage('assets/img/logoWC.png'),
                width: 300,//logo5
                height: 300,
                ),
        ],
      ),
    );
  }
}