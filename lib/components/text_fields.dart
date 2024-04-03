import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller; //use for the access for the textfield
  final String hintText;// sugired text when the textfield is empty
  final bool obscureText;//boolean hide the characters
  const MyTextField({super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
                validator:  (value){
                  if(value == null || value.isEmpty){
                    return "Please enter ";
                  }
                  return null;
                } ,
                controller: controller,
                obscureText: obscureText,

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
                    hintText: hintText,
                ),
              ),
            );
  }
}