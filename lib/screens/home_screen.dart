import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/add_container_screen.dart';
import 'package:integradora2_1/screens/comments_screen.dart';
import 'package:integradora2_1/screens/profile_screen.dart';
import 'package:integradora2_1/screens/reports_screen.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexNavigation = 0 ;

  openScreen(int index, BuildContext context){//variable buildcontext puede que no la pida pero es mejor enviarla
  MaterialPageRoute ruta = MaterialPageRoute( // variable para la ruta
    builder: (context) => const  HomeScreen());
  switch(index){
    case 0: 
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) => const HomeScreen());
      break;
    case 1: 
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) => const CommentsScreen());  
      break;
    case 2:
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) => const ReportsScreen());
      break;
    case 3: 
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) => const ProfileScreen());    
      break;
  }
  setState(() {
    indexNavigation = index; 
    Navigator.push(context, ruta);
  });
  }
  final user = FirebaseAuth.instance.currentUser;
  
  //sign user out method
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Care'),
        actions: [
          IconButton(onPressed: signUserOut, icon:const  Icon(Icons.logout))
        ],
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           const Row(
             children: [
                Image(
                    image: AssetImage('assets/img/logoWC.png'),
                    width: 100,//logo5
                    height: 120,
                    ),
                     SizedBox(width: 170.5),
                     Column(
                      children: [
                        // GestureDetector(
                        //   onTap:() {
                        //             Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()),
                        //             );
                        //             },
                        //   child: Container(
                        //     padding: const EdgeInsets.all(5),//tamaño del boton vertical
                        //     margin: const EdgeInsets.symmetric(horizontal: 15),//tamaño del boton horizontal
                        //     decoration:  BoxDecoration(color: Colors.blue,
                        //     borderRadius: BorderRadius.circular(25)),//border
                        //     child: const Center(
                        //       child: Text('Log out',
                        //       style: TextStyle(color: Colors.white,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 14.0
                        //       ),
                        //       ),
                        //       ),
                        //   ),
                        // ),
                        
                        
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
           user != null ? Text('Logged in as: ${user?.email}') : const Text('Not logged in'),

          const SizedBox(height: 420.0),
          
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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexNavigation,
          backgroundColor: Colors.lightBlue,
          unselectedItemColor: Colors.blue[100],
          selectedItemColor: Colors.blue,
          onTap: (index)=> openScreen(index, context),//para ver en que ventana estoy // openScreen metodo es para las rutas
          items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.comment),
          label: "Comments",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.picture_as_pdf),
          label: "Reports",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.person_sharp),
          label: "Profile",
          ),
          ]
          ),
    );
  }
}