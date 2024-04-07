import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/add_container_screen.dart';
import 'package:integradora2_1/screens/comments_screen.dart';
import 'package:integradora2_1/screens/login_screen.dart';
import 'package:integradora2_1/screens/profile_screen.dart';
import 'package:integradora2_1/screens/reports_screen.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);
  }
  
  void openScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CommentsScreen()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportsScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Care'),
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('contenedores').snapshots(),
        builder: (context, snapshot) {
              if(snapshot.hasError){
                return const Text('Error al cargar los datos');
              }
              if (snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              final docs = snapshot.data!.docs;
              ;
      return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Row(
                children: [
                   Image(
                    image: AssetImage('assets/img/logoWC.png'),
                    width: 100,
                    height: 120,
                  ),
                   SizedBox(width: 10.5),
                ],
              ),
              Text('Logged in as:'+ user.email!), 
              const Divider(),
              const Text(
                'Container`s list :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              const SizedBox(height:5.0),
              //aqui quiero los list tile de los contenedores que existan 
              Expanded(child: ListView.builder(
                shrinkWrap: true,
                itemCount: docs.length,
                itemBuilder: (context,index){
                  final contenedor = docs[index].data() as Map<String, dynamic>;
                  return ListTile(
                    title: Text(contenedor['capacidad'].toString()),
                    subtitle: Text(contenedor['condicion']),
                  );
                },
                )
                ),
              Divider(),
              Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddContainer()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 115),
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                            child: Text(
                              'Add Container',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            ],
          );
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set initial selected index (optional)
        backgroundColor: Colors.lightBlue,
        unselectedItemColor: Colors.blue[100],
        selectedItemColor: Colors.blue,
        onTap: (index) => openScreen(index, context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: "Comments"),
          BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: "Reports"),
          BottomNavigationBarItem(icon: Icon(Icons.person_sharp), label: "Profile"),
        ],
      ),
    );
  }
}
