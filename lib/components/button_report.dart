
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart'as pw;

class MybuttonReport extends StatefulWidget {

  final Function()? onTap;
  const MybuttonReport({super.key, required this.onTap});

  @override
  State<MybuttonReport> createState() => _MybuttonReportState();
}

class _MybuttonReportState extends State<MybuttonReport> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
                Future<void> generatePDF() async {
  // Crea el documento PDF
  final pdf = pw.Document();

  // Añade una página al PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        // Contenido de la página
        return pw.Center(
          child: pw.Text('Hola, este es un PDF generado desde Flutter.'),
        );
      },
    ),
  );

  // Guarda el PDF en el dispositivo
  final output = await getExternalStorageDirectory();
  final file = File('${output?.path}/example.pdf');
  await file.writeAsBytes(await pdf.save());

  print('PDF generado en: ${file.path}');
}
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   const HomeScreen()),
                );
                },
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 110),//tamaño del boton horizontal
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Generate report',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
    );
  }
}