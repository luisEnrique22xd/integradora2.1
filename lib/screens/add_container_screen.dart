import 'package:flutter/material.dart';
import 'package:integradora2_1/components/buttoncontainer.dart';
import 'package:integradora2_1/components/text_fields_options.dart';

class AddContainer extends StatelessWidget {
  const AddContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Care'),
      ),
      body:  SingleChildScrollView(
        child:  Column(
        children: [
           const Image(
                image: AssetImage('assets/img/logoWC.png'),
                width: 200,//logo5
                height: 200,
                ),
          const SizedBox(height: 25.0),
          const Text('Add your container',
          style: TextStyle(fontSize: 22.5,
          fontWeight: FontWeight.bold),),
           const SizedBox(height: 15.0),
          MyTextFieldOptions(controller: null, hintText: 'Capacity',
          decoration: InputDecoration(
            suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {
           // Mostrar la lista de sugerencias
              },
          )
          ),
          ),
          const SizedBox(height: 15.0),
          MyTextFieldOptions(controller: null, hintText: 'Condition',
          decoration: InputDecoration(
            suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {
           // Mostrar la lista de sugerencias
              },
          )
          ),),
          const SizedBox(height: 15.0),
          MyTextFieldOptions(controller: null, hintText: 'Brand', 
          decoration: InputDecoration(
            suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {
           // Mostrar la lista de sugerencias
              },
          )
          ),),
          const  SizedBox(height: 15.0),
          MyTextFieldOptions(controller: null, hintText: 'Select frecuency',
          decoration: InputDecoration(
            suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {
              const Text('Hola');
              },
          )
          ),),
           const SizedBox(height: 15.0),
           const MybuttonContainer(onTap: null)
        ]),
      )
    );
  }
}