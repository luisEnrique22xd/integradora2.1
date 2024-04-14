import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/components/text_fields_options.dart';
import 'package:integradora2_1/screens/home_screen.dart';

class AddContainer extends StatefulWidget {
  const AddContainer({super.key});

  @override
  State<AddContainer> createState() => _AddContainerState();
}

class _AddContainerState extends State<AddContainer> {
  final TextEditingController  nameController= TextEditingController();
  final TextEditingController  capacityController = TextEditingController();
  final TextEditingController  conditionController = TextEditingController();
  final TextEditingController  brandController = TextEditingController();

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
                image: AssetImage('assets/images/logoWC.png'),
                width: 200,//logo5
                height: 200,
                ),
          const SizedBox(height: 25.0),
          const Text('Add your container',
          style: TextStyle(fontSize: 22.5,
          fontWeight: FontWeight.bold),),
           const SizedBox(height: 15.0),
           MyTextFieldOptions(controller: nameController, hintText: 'Name',keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {
           // Mostrar la lista de sugerencias
              },
          )
          ),),
          const SizedBox(height: 15,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextField(
                controller: capacityController,
                keyboardType: const TextInputType.numberWithOptions(),
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
                    hintText: 'Capacity',
                ),
              ),
            ),
          const SizedBox(height: 15.0),
          MyTextFieldOptions(controller: conditionController, hintText: 'Condition',keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {
           // Mostrar la lista de sugerencias
              },
          )
          ),),
          const SizedBox(height: 15.0),
          MyTextFieldOptions(controller: brandController, hintText: 'Brand', keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {
           // Mostrar la lista de sugerencias
              },
          )
          ),),
          const  SizedBox(height: 15.0),
          MyTextFieldOptions(controller: null, hintText: 'Select frecuency',keyboardType: TextInputType.number,
          decoration: InputDecoration(
            suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {
              const Text('Hola');
              },
          )
          ),),
           const SizedBox(height: 15.0),
          GestureDetector(
        onTap: () async {
        // 1. Validación de entrada (opcional)
        if (nameController.text.isEmpty || capacityController.text.isEmpty ||
            conditionController.text.isEmpty ||
            brandController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Por favor, rellena todos los campos.'),
            ),
          );
          return; // Prevenir la ejecución posterior si la validación falla
        }

        // 2. Extraer valores de texto y crear mapa de datos
        final int capacity = int.parse(capacityController.text);
        final String condition = conditionController.text;
        final String brand = brandController.text;
        final String name = nameController.text;
        final contenedor = {
          'capacity': capacity,
          'condition': condition,
          'brand': brand,
          'name': name
        };

        // 3. Agregar datos a Firestore con manejo de errores
        try {
          await FirebaseFirestore.instance.collection('contenedores').add(contenedor);
          // Mostrar mensaje de éxito (opcional)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Contenedor añadido correctamente!'),
            ),
          );
        } on FirebaseException catch (e) {
          // Manejar excepciones específicas de Firestore
          print(e.code);
          print(e.message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al añadir contenedor: ${e.message}'),
            ),
          );
        } catch (e) {
          // Manejar otras excepciones (por ejemplo, errores de red)
          print(e.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Se ha producido un error. Inténtalo de nuevo.'),
            ),
          );
        } finally {
          // Siempre ejecutar este bloque, incluso si se producen excepciones
          // (por ejemplo, restablecer elementos de la interfaz de usuario)
          capacityController.text = '';
          conditionController.text = '';
          brandController.text = '';
          nameController.text = '';
        }

        // 4. Navegar a la pantalla de inicio (opcional)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 120),//tamaño del boton horizontal
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Add Container',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
    ),
        ]),
      )
    );
  }
}