import 'package:cloud_firestore/cloud_firestore.dart';
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
  final TextEditingController  capacityController = TextEditingController();

  openScreen(int index, BuildContext context){//variable buildcontext puede que no la pida pero es mejor enviarla
  MaterialPageRoute ruta = MaterialPageRoute( // variable para la ruta
    builder: (context) =>   HomeScreen());
  switch(index){
    case 0: 
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) =>   HomeScreen());
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
      body:  Column(
        children: [
          Text('here send your comments'),
          MyTextFieldArea(controller: null, hintText: "Comment", obscureText: false),
          SizedBox(height: 15.0),
          MybuttonComment(
            onTap: null,
      //       onTap: () async {
      //   // 1. Validación de entrada (opcional)
      //   if (commentcontroller.text.isEmpty) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text('Por favor, rellena todos los campos.'),
      //       ),
      //     );
      //     return; // Prevenir la ejecución posterior si la validación falla
      //   }

      //   // 2. Extraer valores de texto y crear mapa de datos
      //   final String comment = commentcontroller.text;
      //   final comentarios = {
      //     'usuario': user.email,
      //     'comentario': comment,
      //   };

      //   // 3. Agregar datos a Firestore con manejo de errores
      //   try {
      //     await FirebaseFirestore.instance.collection('contenedores').add(comentarios);
      //     // Mostrar mensaje de éxito (opcional)
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text('Contenedor añadido correctamente!'),
      //       ),
      //     );
      //   } on FirebaseException catch (e) {
      //     // Manejar excepciones específicas de Firestore
      //     print(e.code);
      //     print(e.message);
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text('Error al añadir contenedor: ${e.message}'),
      //       ),
      //     );
      //   } catch (e) {
      //     // Manejar otras excepciones (por ejemplo, errores de red)
      //     print(e.toString());
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text('Se ha producido un error. Inténtalo de nuevo.'),
      //       ),
      //     );
      //   } finally {
      //     // Siempre ejecutar este bloque, incluso si se producen excepciones
      //     // (por ejemplo, restablecer elementos de la interfaz de usuario)
      //     commentcontroller.text = '';
      //   }

      //   // 4. Navegar a la pantalla de inicio (opcional)
      //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()),
      //           );
      // },
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