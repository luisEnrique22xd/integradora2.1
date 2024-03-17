import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/add_container_screen.dart';
import 'package:integradora2_1/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Care'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Row(
             children: [
               const Image(
                    image: AssetImage('assets/img/logoWC.png'),
                    width: 150,//logo5
                    height: 125,
                    ),
                    const SizedBox(width: 118.5),
                    Column(
                      children: [
                        GestureDetector(
                          onTap:() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()),
                                    );
                                    },
                          child: Container(
                            padding: const EdgeInsets.all(5),//tamaño del boton vertical
                            margin: const EdgeInsets.symmetric(horizontal: 15),//tamaño del boton horizontal
                            decoration:  BoxDecoration(color: Colors.blue,
                            borderRadius: BorderRadius.circular(25)),//border
                            child: const Center(
                              child: Text('Log out',
                              style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0
                              ),
                              ),
                              ),
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        GestureDetector(
                          onTap:() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),
                                    );
                                    },
                          child: Container(
                            padding: const EdgeInsets.all(5),//tamaño del boton vertical
                            margin: const EdgeInsets.symmetric(horizontal: 10),//tamaño del boton horizontal
                            decoration:  BoxDecoration(color: Colors.blue,
                            borderRadius: BorderRadius.circular(25)),//border
                            child: const Center(
                              child: Text(' Profile ',
                              style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                              ),
                              ),
                          ),
                        ),
                      ],
                    )
             ],
           ),//head
          const Divider(),
          const Text('List of containers: ',
          style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 25.0,
          ),
          ),
          const SizedBox(height: 460.0),
          
          GestureDetector(
                          onTap:() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddContainer()),
                                    );
                                    },
                          child: Container(
                            padding: const EdgeInsets.all(10),//tamaño del boton vertical
                            margin: const EdgeInsets.symmetric(horizontal: 115),//tamaño del boton horizontal
                            decoration:  BoxDecoration(color: Colors.blue,
                            borderRadius: BorderRadius.circular(25)),//border
                            child: const Center(
                              child: Text(' add container ',
                              style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                              ),
                              ),
                          ),
                        ),

        ],
      ),
    );
  }
}