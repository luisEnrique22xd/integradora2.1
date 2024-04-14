import 'package:flutter/material.dart';
import 'package:integradora2_1/components/button_report.dart';
import 'package:integradora2_1/screens/comments_screen.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';  
import 'package:pdf/widgets.dart'as pw;

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  int indexNavigation = 1 ;

  void openScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportsScreen()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CommentsScreen()));
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Text('Here create your reports: ',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),),
          const Divider(),
          const SizedBox(height: 15.0,),
           MybuttonReport(onTap:() {
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
  final file = File('cd/example.pdf');
  await file.writeAsBytes(await pdf.save());

  print('PDF generado en: ${file.path}');
}
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   const HomeScreen()),
                );
                },),
          const SizedBox(height: 15,),
          const Text('Reports List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 15,),
          const Divider(),
          Expanded(child: ListView.builder(
                shrinkWrap: true,
                itemCount: //docs.length
                4,
                itemBuilder: (context,index){
                  // final contenedor = docs[index].data() as Map<String, dynamic>;
                  return const ListTile(
                    title: //Text(contenedor['name'] != null ? "Name: " + contenedor['name'] : ''),
                    Text('Reporte: '),
                    subtitle: //Text(contenedor['capacity'] != null ? "Capacity: " + contenedor['capacity'].toString()+"Lts.": ''),
                    Text('Fecha: '),
                    trailing: IconTheme(data: IconThemeData(color: Colors.blue, size: 24), child:  Icon(Icons.arrow_forward_ios),),
                    leading: IconTheme(data: IconThemeData(color: Colors.blue, size: 24), child:  Icon(Icons.picture_as_pdf)),
                  );
                },
                )
                ),
          const Divider()
        ],

      ),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set initial selected index (optional)
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.blue[100],
        selectedItemColor: Colors.blue,
        onTap: (index) => openScreen(index, context),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true  ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: "Reports"),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_rounded), label: "Profile/Comments"),
        ],
      ),
    );
  }
}