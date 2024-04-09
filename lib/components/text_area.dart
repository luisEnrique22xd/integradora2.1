import 'package:flutter/material.dart';

class MyTextFieldArea extends StatelessWidget {
  final controller; //use for the access for the textfield
  final String hintText;// sugired text when the textfield is empty
  final bool obscureText;//boolean hide the characters
  const MyTextFieldArea({super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText});

  @override
  Widget build(BuildContext context) {
    final TextEditingController  commentcontroller = TextEditingController();
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextField(
                maxLines: 5,
                controller: commentcontroller,
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