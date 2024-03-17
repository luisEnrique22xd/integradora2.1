import 'package:flutter/material.dart';
import 'package:integradora2_1/components/button_add_account.dart';
import 'package:integradora2_1/components/button_delete_account.dart';
import 'package:integradora2_1/components/button_edit_account.dart';
import 'package:integradora2_1/screens/comments_screen.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:integradora2_1/screens/login_screen.dart';
import 'package:integradora2_1/screens/reports_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int indexNavigation = 3 ;

  openScreen(int index, BuildContext context){//variable buildcontext puede que no la pida pero es mejor enviarla
  MaterialPageRoute ruta = MaterialPageRoute( // variable para la ruta
    builder: (context) => const HomeScreen());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Profile')
      ),
      body: Column(
        children: [
          Row(
             children: [
               const Image(
                    image: AssetImage('assets/img/logoWC.png'),
                    width: 100,//logo5
                    height: 120,
                    ),
                    const SizedBox(width: 170.5),
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
                        
                      ],
                    )
             ],
           ),//head
           const Divider(),
           const Text('Usuario'),
          const Row(
            children: [
              Text('Imagen'),
              SizedBox(width:190.0),
              Text('Datos personales')
            ],
           ),
           const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MybuttonEditAcc(onTap: null),
              MybuttonDeleteAcc(onTap: null)
            ],
            ),
            const SizedBox(height: 25),
            const MybuttonAddAcc(onTap: null)
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