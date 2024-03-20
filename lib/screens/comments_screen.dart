import 'package:flutter/material.dart';
import 'package:integradora2_1/components/button_comment.dart';
import 'package:integradora2_1/components/text_area.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:integradora2_1/screens/profile_screen.dart';
import 'package:integradora2_1/screens/reports_screen.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  int indexNavigation = 1 ;

  openScreen(int index, BuildContext context){//variable buildcontext puede que no la pida pero es mejor enviarla
  MaterialPageRoute ruta = MaterialPageRoute( // variable para la ruta
    builder: (context) => const  HomeScreen());
  switch(index){
    case 0: 
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) =>  const HomeScreen());
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
        title: const Text('Comentarios'),
      ),
      body: const Column(
        children: [
          Text('here send your comments'),
          Text('Username'),
          MyTextFieldArea(controller: null, hintText: "Comment", obscureText: false),
          SizedBox(height: 15.0),
          MybuttonComment(onTap: null),
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