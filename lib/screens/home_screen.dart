import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/add_container_screen.dart';
import 'package:integradora2_1/screens/comments_screen.dart';
import 'package:integradora2_1/screens/details_container_screen.dart';
import 'package:integradora2_1/screens/login_screen.dart';
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
        title: const Text('Water Care',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
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
              
      return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               const Row(
                children: [
                   Image(
                    image: AssetImage('assets/images/logoWC.png'),
                    width: 349.5,
                    height: 140,
                  ),
                   SizedBox(width: 10.5),
                ],
              ),
              const SizedBox(height: 15.0,),
              Text('Logged in as:${user.email!}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),), 
              const Divider(),
              const Text(
                'Container s list :',
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
                    title: Text(contenedor['name'] != null ? "Name: " + contenedor['name'] : ''),
                    subtitle: Text(contenedor['capacity'] != null ? "Capacity: ${contenedor['capacity']}Lts.": ''),
                    trailing: const  IconTheme(data: IconThemeData(color: Colors.blue, size: 24), child:  Icon(Icons.arrow_forward_ios),),
                    leading: const IconTheme(data: IconThemeData(color: Colors.blue, size: 24), child:  Icon(Icons.water_damage_outlined)),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const DetailsContainer()), );
                    },
                  );
                },
                )
                ),
              const Divider(),
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
                 const SizedBox(height: 5,)
            ],
          );
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set initial selected index (optional)
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.blue[100],
        selectedItemColor: Colors.blue,
        onTap: (index) => openScreen(index, context),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true  ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: "Reports"),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_rounded), label: "Profile/Comments"),
        ],
      ),
    );
  }
}
