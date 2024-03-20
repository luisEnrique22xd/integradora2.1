import 'package:flutter/material.dart';
import 'package:integradora2_1/components/button_update_profile.dart';
import 'package:integradora2_1/components/text_fields.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          const Text("Set the new information to update",
          style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 15.0),),
          const SizedBox(height: 20.0,),
          const MyTextField(controller: null, hintText: "Name", obscureText: false),
          space(),
          const MyTextField(controller: null, hintText: "Last Name", obscureText: false),
          space(),
          const MyTextField(controller: null, hintText: "Password", obscureText: true),
          space(),
          const MyTextField(controller: null, hintText: "Phone", obscureText: false),
          space(),
         const  MyTextField(controller: null, hintText: "Address", obscureText: false),
          space(),
          const UpdateProfile(onTap: null)
        ],
      ),
      )
    );
  }

  SizedBox space() => const SizedBox(height: 15.0,);
}