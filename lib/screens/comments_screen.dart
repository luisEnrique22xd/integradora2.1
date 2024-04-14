import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:integradora2_1/screens/reports_screen.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  int indexNavigation = 2 ;
  final TextEditingController  commentcontroller = TextEditingController();

  void openScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportsScreen()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CommentsScreen()));
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
      ),
      body:  Column(
        children: [
          const Image(
                    image: AssetImage('assets/images/logoWC.png'),
                    width: 100,//logo5
                    height: 120,
                    ),
          const Text('Send you comments!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(height: 15,),
          Text('User: ${user.email!}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          const SizedBox(height: 15,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextField(
                maxLines: 5,
                controller: commentcontroller,
                obscureText: false,

                decoration:   InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                    ),
                    fillColor: Colors.blue[100],
                    filled: true,
                    hintText: "Type your comment here",
                ),
              ),
            ),
          const SizedBox(height: 15.0),
          GestureDetector(
            onTap: () async {
              print(commentcontroller);
              if (commentcontroller.text.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Llena todos los campos'),
            ),
          );
          return ;
        }
        // 3. Agregar datos a Firestore con manejo de errores
        try {
          // 2. Extract values and create data map
    final user = FirebaseAuth.instance.currentUser!;
    final comentarios = {
      'usuario': user.email,
      'comentario': commentcontroller.text,
    };
          await FirebaseFirestore.instance.collection('comentarios').add(comentarios);
          // Mostrar mensaje de éxito (opcional)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Comentario enviado correctamente!'),
            ),
          );
        } on FirebaseException catch (e) {
          // Manejar excepciones específicas de Firestore
          print(e.code);
          print(e.message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al enviar tu comentario: ${e.message}'),
            ),
          );
        } catch (e) {
          // Manejar otras excepciones (por ejemplo, errores de red)
          print(e.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Se ha producido un error. Inténtalo de nuevo.'),
            ),
          );
        } finally {
          // Siempre ejecutar este bloque, incluso si se producen excepciones
          // (por ejemplo, restablecer elementos de la interfaz de usuario)
          commentcontroller.text = '';
        }

        // 4. Navegar a la pantalla de inicio (opcional)
       Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()),
                );
      },
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 120),//tamaño del boton horizontal
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Save comment',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
      ),
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set initial selected index (optional)
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.blue[100],
        selectedItemColor: Colors.blue,
        onTap: (index) => openScreen(index, context),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true  ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: "Reports"),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_rounded), label: "Profile/Comments"),
        ],
      ),
    );
  }
}