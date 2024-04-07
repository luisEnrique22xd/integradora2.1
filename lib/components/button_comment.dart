
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/home_screen.dart';


class MybuttonComment extends StatefulWidget {
  final Function()? onTap;
  const MybuttonComment({super.key, required this.onTap});

  @override
  State<MybuttonComment> createState() => _MybuttonCommentState();
}

class _MybuttonCommentState extends State<MybuttonComment> {
final TextEditingController  commentcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () async {
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
      //   User? user = FirebaseAuth.instance.currentUser;
      //   if (user!= null){
      //     final String username = user.displayName ?? user.email;
      //     final comentarios = {
      //     'usuario': username,
      //     'comentario': comment,
      //   }
      //   }

      //   // 3. Agregar datos a Firestore con manejo de errores
      //   try {
      //     await FirebaseFirestore.instance.collection('comentarios').add(comentarios);
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
      //   else{
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User not authenticated")))
      //   }

      //   // 4. Navegar a la pantalla de inicio (opcional)
      //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()),
      //           );
      // },        
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 120),//tamaño del boton horizontal
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Add Container',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
    );
  }
}