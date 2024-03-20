import 'package:flutter/material.dart';
import 'package:integradora2_1/components/button_register.dart';
import 'package:integradora2_1/components/text_fields.dart';
import 'package:integradora2_1/screens/login_screen.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          children: [
            const SizedBox(
              //img size
              height: 250.0,
              width: 200.0,
              child:
               Image(
                image: AssetImage('assets/img/logoWC.png')//logo
                )
            ),
            const Text("Welcome to Water Care ",
            style: TextStyle(fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            )
            ),
             const SizedBox(
              height: 25.0,
            ),
            const MyTextField(
              controller: null,
              hintText: "Name",
              obscureText: false,
            ),
            const SizedBox(
              height: 15.0,
            ),
            const MyTextField(controller: null, hintText: 'Last Name', obscureText: false),
            const SizedBox(height: 15.0,),
            const MyTextField(controller: null, hintText: 'Password', obscureText: true),
            const SizedBox(
              height: 15.0,
            ),
           const  MyTextField(controller: null, hintText: 'Phone', obscureText: false),
           const  SizedBox(height: 15.0,),
            const MyTextField(controller: null, hintText: 'Address', obscureText: false),
            const SizedBox(height: 25.0,),
           const  MybuttonR(onTap: null),
           const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Are you an user?'),
                 const SizedBox(width: 5.0,),
                 GestureDetector(
                      child: const Text(
                         'Log in',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline, // Add underlining for emphasis
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  LoginScreen()),
                        );
                      },
                    ),
               
              ],
            ),
          ],
        ),
      ),
      )
    );
  }
}