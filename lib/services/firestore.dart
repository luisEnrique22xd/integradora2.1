import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  //get collection of nodes
  final CollectionReference container =  
    FirebaseFirestore.instance.collection('containers');
}