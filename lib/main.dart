import 'package:flutter/material.dart';
import 'package:integradora2_1/firebase_options.dart';
import 'package:integradora2_1/main_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MainApp());
}

