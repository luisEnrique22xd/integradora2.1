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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage('assets/img/logoWC.png'),
                width: 100,
                height: 120,
              ),
              const SizedBox(width: 10.5),
            ],
          ),
          const Divider(),
          const Text(
            'Information of container:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          Text('Logged in as:'+ user.email!), 
              
          const SizedBox(height: 400.0),
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
