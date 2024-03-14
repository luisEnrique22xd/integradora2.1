import 'package:flutter/material.dart';
import 'package:integradora2_1/components/button.dart';
import 'package:integradora2_1/components/text_fields.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
             SizedBox(
              //img size
              height: 250.0,
              width: 200.0,
              child:
               Image(
                image: AssetImage('assets/img/logoWC.png')//logo
                )
            ),
            Text("Welcome to Water Care ",
            style: TextStyle(fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            )
            ),
             SizedBox(
              height: 25.0,
            ),
            MyTextField(
              controller: null,
              hintText: "Name",
              obscureText: false,
            ),
            SizedBox(
              height: 15.0,
            ),
            MyTextField(controller: null, hintText: 'Last Name', obscureText: false),
            SizedBox(height: 15.0,),
            MyTextField(controller: null, hintText: 'Password', obscureText: true),
            SizedBox(
              height: 15.0,
            ),
            MyTextField(controller: null, hintText: 'Phone', obscureText: false),
            SizedBox(height: 15.0,),
            MyTextField(controller: null, hintText: 'Address', obscureText: false),
            SizedBox(height: 25.0,),
            Mybutton(onTap: null),
          ],
        ),
      ),
    );
  }
}