import 'package:flutter/material.dart';

import 'package:integradora2_1/components/button.dart';
import 'package:integradora2_1/components/text_fields.dart';
import 'package:integradora2_1/screens/register_now.dart';
import 'package:integradora2_1/themes/app_theme.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      body: Center(
        child: Column( 
          children: [
               const Image(
                image: AssetImage('assets/img/logoWC.png'),
                width: 300,//logo5
                height: 300,
                ),
            space(),
           const Text('Welcome back to WaterCare',//title
            style: TextStyle(fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            ),
            ),
            const SizedBox(height: 25,),
            //username field
             MyTextField(
              controller: usernameController,
              hintText: "Username",
              obscureText: false,
            ),
            const SizedBox(height: 25,),
             //password textfiel
             MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 10,),
            //forgot password?
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal:25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Fogot password?',
                  style: TextStyle(fontSize: 13.0,
                  fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            //sign buttton
             Mybutton(onTap: signUserIn,),

             const SizedBox(height: 20,),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not an user?',), 
                const SizedBox(width: 4,),
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
             )

          ],
        ),
      ),
    );
  }

  SizedBox space() => const SizedBox(height: 5,);
} 