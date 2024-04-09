import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsContainer extends StatefulWidget {
  const DetailsContainer({super.key});

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('More information about.'),
      ),
    body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('contenedores').snapshots(),
        builder: (context, snapshot) {
              if(snapshot.hasError){
                return const Text('Error al cargar los datos');
              }
              if (snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              final docs = snapshot.data!.docs;
              return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, index) {
        final contenedor = docs[index].data() as Map<String, dynamic>;

        return ListTile(
          
            title: Text(
              contenedor['name'] != null ? "Name: " + contenedor['name'] : '',
            ),
            subtitle: Text(
              contenedor['capacity'] != null
                  ? "Capacity: ${contenedor['capacity'].toString()} Lts"
                  : '',
            ),
          );
      },
    );
        }
    ),
    );
  }
}