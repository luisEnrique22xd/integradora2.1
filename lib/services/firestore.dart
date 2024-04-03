import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  //get collection of nodes
  final CollectionReference container =  
    FirebaseFirestore.instance.collection('containers');
  //Create: add a new noe
  // Future<void> addContainer(String container){
  //   return container.add({
  //     'capacity': int,
  //     'condition':String,
  //     'brand': String,
  //   });
  // }
  //Read: get notes from database

  //update: update notes given a doc id

  //Delete: delete notes given a doc id
}