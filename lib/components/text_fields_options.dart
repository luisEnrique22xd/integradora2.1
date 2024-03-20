import 'package:flutter/material.dart';

class MyTextFieldOptions extends StatelessWidget {
  final controller; //use for the access for the textfield
  final String hintText;// sugired text when the textfield is emptyoolean hide the characters
  const MyTextFieldOptions({super.key,
  required this.controller,
  required this.hintText,
  required InputDecoration decoration});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextField(
                controller: controller,

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