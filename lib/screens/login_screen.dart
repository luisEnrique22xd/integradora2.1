import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/components/button.dart';
import 'package:integradora2_1/components/text_fields.dart';
import 'package:integradora2_1/screens/register_now.dart';
import 'package:integradora2_1/themes/app_theme.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key,});

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  Future<void> signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Navegar a la pantalla de inicio o mostrar mensaje de éxito
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No se encontró ningún usuario para el correo electrónico proporcionado.');
        // Mostrar mensaje de error al usuario (por ejemplo, "Correo electrónico o contraseña inválidos")
      } else if (e.code == 'wrong-password') {
        print('Se proporcionó una contraseña incorrecta para el correo electrónico.');
        // Mostrar mensaje de error al usuario (por ejemplo, "Correo electrónico o contraseña inválidos")
      } else {
        print(e.code); // Registrar otros errores para depuración
      }
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
          MyTextField(
            controller: emailController,
            hintText: "Username",
            obscureText: false,
          ),
          const SizedBox(height: 25),

          // Password textfield
          MyTextField(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
          ),
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
          Mybutton(onTap: signUserIn),

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