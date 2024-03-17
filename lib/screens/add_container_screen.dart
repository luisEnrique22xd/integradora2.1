import 'package:flutter/material.dart';
import 'package:integradora2_1/components/button_Container.dart';
import 'package:integradora2_1/components/text_fields.dart';

class AddContainer extends StatelessWidget {
  const AddContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Care'),
      ),
      body: const Column(
        children: [
           Image(
                image: AssetImage('assets/img/logoWC.png'),
                width: 200,//logo5
                height: 200,
                ),
          SizedBox(height: 25.0),
          Text('Add your container',
          style: TextStyle(fontSize: 22.5,
          fontWeight: FontWeight.bold),),
           SizedBox(height: 15.0),
          MyTextField(controller: null, hintText: 'Capacity', obscureText: false),
           SizedBox(height: 15.0),
          MyTextField(controller: null, hintText: 'Condition', obscureText: false),
           SizedBox(height: 15.0),
          MyTextField(controller: null, hintText: 'Brand', obscureText: false),
           SizedBox(height: 15.0),
          MyTextField(controller: null, hintText: 'Select frecuency', obscureText: false),
           SizedBox(height: 15.0),
           MybuttonContainer(onTap: null)
        ]),
    );
  }
}