import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:integradora2_1/screens/register_now.dart';
import 'package:integradora2_1/themes/app_theme.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key,});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text editing controllers
  final bool obscureText = false;
  TextEditingController mailcontroller =  TextEditingController();
  TextEditingController passwordcontroller=  TextEditingController();

  Future<void> login() async{//metodo para la validacion de usuarios 
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: mailcontroller.text, password: passwordcontroller.text,);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>   const HomeScreen()),);
    }on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error login in, verify your data")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: AppTheme.backColor,

  body: SingleChildScrollView( // Wrap the content with SingleChildScrollView
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/img/logoWC.png'),
            width: 300,
            height: 300,
          ),
          space(),
          const Text(
            'Welcome back to WaterCare',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
          ),

          const SizedBox(height: 25),

          // Username field
          
          const SizedBox(height: 25),

          // Password textfield
          Container(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
                controller: mailcontroller,
                validator:  (value){
                  if(value == null || value.isEmpty){
                    return "Please enter username";
                  }
                  return null;
                } ,
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
                    hintText: "Username",
                ),
              ),
            ),
            const SizedBox(height: 15.0,),
          Container(padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
                controller:  passwordcontroller,
                validator:  (value){
                  if(value == null || value.isEmpty){
                    return "Please enter password";
                  }
                  return null;
                } ,
                obscureText: true,
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
                    hintText: "Password",
                    
                ),
              ),),
          const SizedBox(height: 10),

          // Forgot password?
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot password?',
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Sign button
          GestureDetector(
      onTap:() {login(); //metodo 
      },
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 135),//tamaño del boton horizontal
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Login in',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
    ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Not an user?'),
              const SizedBox(width: 4),
              GestureDetector(
                child: const Text(
                  'Register Now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline, // Add underlining for emphasis
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterNow()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

  }

  SizedBox space() => const SizedBox(height: 5,);
} 