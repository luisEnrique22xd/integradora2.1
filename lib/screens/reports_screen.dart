import 'package:flutter/material.dart';
import 'package:integradora2_1/components/button_report.dart';
import 'package:integradora2_1/screens/comments_screen.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:integradora2_1/screens/profile_screen.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  int indexNavigation = 2 ;

  openScreen(int index, BuildContext context){//variable buildcontext puede que no la pida pero es mejor enviarla
  MaterialPageRoute ruta = MaterialPageRoute( // variable para la ruta
    builder: (context) =>   HomeScreen());
  switch(index){
    case 0: 
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) =>  HomeScreen());
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
        title: const Text('Reports'),
      ),
      body:const Column(
        children: [
          Text('Here create your reports: ',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),),
          Divider(),
          SizedBox(height: 15.0,),
          MybuttonReport(onTap: null)
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