import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/comments_screen.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';  
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:open_file/open_file.dart';


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
  Future<void> _generatePDF() async {
    final PdfDocument document = PdfDocument();
    final PdfPage page = document.pages.add();
    final Size pageSize = page.getClientSize();

    // Dibujar un rectángulo blanco en toda la página
    page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
      pen: PdfPen(PdfColor(0, 83, 136)), //  borde
      brush: PdfSolidBrush(PdfColor(255, 255, 255)), //fondo
    );

    page.graphics.drawString(
      'SMICCAT',
      PdfStandardFont(PdfFontFamily.helvetica, 30, style: PdfFontStyle.bold),
      bounds: Rect.fromLTWH(0, 0, pageSize.width, 100),
      brush: PdfSolidBrush(PdfColor(0, 83, 136)),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );

const double spaceBetweenSections = 20; // Espacio entre las dos secciones
const double rectWidth = 500; // Ancho total del rectángulo
const double rectHeight = 300; // Alto total del rectángulo
const double sectionWidth = (rectWidth - spaceBetweenSections) / 2; // Ancho de cada sección con espacio entre ellas

page.graphics.drawRectangle(
  bounds: Rect.fromLTWH(
    (pageSize.width - rectWidth) / 2, // Centrado horizontalmente
    ((pageSize.height - 600) / 2) + 220, // Posición debajo de la imagen de logoWC
    sectionWidth, // Ancho de la primera sección
    rectHeight, // Alto del rectángulo
  ),
  brush: PdfSolidBrush(PdfColor(207, 231, 255)), // Color blanco
  pen: PdfPen(PdfColor(0, 83, 136), width: 2), // Borde azul fuerte
);



page.graphics.drawRectangle(
  bounds: Rect.fromLTWH(
    (pageSize.width - rectWidth) / 2 + sectionWidth + spaceBetweenSections, // Centrado horizontalmente con espacio
    ((pageSize.height - 600) / 2) + 220, // Posición debajo de la imagen de logoWC
    sectionWidth, // Ancho de la segunda sección
    rectHeight, // Alto del rectángulo
  ),
  brush: PdfSolidBrush(PdfColor(207, 231, 255)), // Color blanco PdfColor(207, 469,755)
  pen: PdfPen(PdfColor(0, 83, 136), width: 2), // Borde azul fuerte
);



const double whiteRectWidth = 150; // Ancho del nuevo rectángulo blanco
const double whiteRectHeight = 150; // Alto del nuevo rectángulo blanco
final double whiteRectX = (pageSize.width - rectWidth) / 2 + (sectionWidth - whiteRectWidth) / 2; // Posición X del nuevo rectángulo blanco
final double whiteRectY = ((pageSize.height - 720) / 2) + 220 + (rectHeight - whiteRectHeight) / 2; // Posición Y del nuevo rectángulo blanco

page.graphics.drawRectangle(
  bounds: Rect.fromLTWH(
    whiteRectX, // Posición X del nuevo rectángulo blanco
    whiteRectY, // Posición Y del nuevo rectángulo blanco
    whiteRectWidth, // Ancho del nuevo rectángulo blanco
    whiteRectHeight, // Alto del nuevo rectángulo blanco
  ),
  brush: PdfSolidBrush(PdfColor(255, 255, 255)), // Color blanco
);

const String textBelowRectangle2 = '25%';
const String textBelowRectangle3 = 'Información sobre la cantidad de agua consumida durante el mes.';

// Posición Y para los textos adicionales
final double textY1 = whiteRectY + whiteRectHeight + 8; // Espacio adicional entre los textos
final double textY2 = textY1 + 50; // Separación entre el primer y segundo texto adicional

// Texto adicional 1
page.graphics.drawString(
  textBelowRectangle2,
  PdfStandardFont(PdfFontFamily.helvetica, 30, style: PdfFontStyle.bold),
  bounds: Rect.fromLTWH(
    whiteRectX, // Posición X del texto
    textY1, // Posición Y del texto (debajo del rectángulo blanco con un margen adicional)
    whiteRectWidth, // Ancho del texto (mismo que el rectángulo blanco)
    50, // Alto del texto
  ),
  brush: PdfSolidBrush(PdfColor(0, 83, 136)), // Color negro para el texto
  format: PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.middle,
  ),
);

// Texto adicional 2
page.graphics.drawString(
  textBelowRectangle3,
  PdfStandardFont(PdfFontFamily.helvetica, 12),
  bounds: Rect.fromLTWH(
    whiteRectX, // Posición X del texto
    textY2, // Posición Y del texto (debajo del texto adicional 1)
    whiteRectWidth, // Ancho del texto (mismo que el rectángulo blanco)
    50, // Alto del texto
  ),
  brush: PdfSolidBrush(PdfColor(0, 0, 0)), // Color negro para el texto
  format: PdfStringFormat(
    alignment: PdfTextAlignment.justify,
    lineAlignment: PdfVerticalAlignment.middle,
  ),
);

const double whiteRect = 150; // Ancho del nuevo rectángulo blanco
const double whiteRectH = 150; // Alto del nuevo rectángulo blanco
final double whiteRectX2 = 315; // Posición X del nuevo rectángulo blanco
final double whiteRectY2= 320; // Posición Y del nuevo rectángulo blanco

page.graphics.drawRectangle(
  bounds: Rect.fromLTWH(
    whiteRectX2, // Posición X del nuevo rectángulo blanco
    whiteRectY2, // Posición Y del nuevo rectángulo blanco
    whiteRect, // Ancho del nuevo rectángulo blanco
    whiteRectH, // Alto del nuevo rectángulo blanco
  ),
  brush: PdfSolidBrush(PdfColor(255, 255, 255)), // Color blanco(207, 469,755)
);

const String textBelowImage1 = 'Media';
const String textBelowImage2 = 'Información sobre la calidad de agua almacenada durante el mes.';

// Calcular las coordenadas X e Y para los textos debajo de la imagen "cant.png"
final double textX = (pageSize.width - rectWidth) / 2 + sectionWidth + spaceBetweenSections + (sectionWidth - whiteRectWidth) / 2; // Posición X de los textos
final double texty1 = ((pageSize.height - 720) / 2) + 220 + (rectHeight - whiteRectHeight) / 2+ 155; // Posición Y del primer texto debajo de la imagen
final double texty2 = textY1 + 50; // Separación entre el primer y segundo texto debajo de la imagen

// Texto debajo de la imagen 1
page.graphics.drawString(
  textBelowImage1,
  PdfStandardFont(PdfFontFamily.helvetica, 30, style: PdfFontStyle.bold),
  bounds: Rect.fromLTWH(
    textX, // Posición X del texto
    texty1, // Posición Y del texto (debajo de la imagen)
    whiteRectWidth, // Ancho del texto (mismo que el rectángulo blanco)
    50, // Alto del texto
  ),
  brush: PdfSolidBrush(PdfColor(0, 83, 136)), // Color negro para el texto
  format: PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.middle,
  ),
);

// Texto debajo de la imagen 2
page.graphics.drawString(
  textBelowImage2,
  PdfStandardFont(PdfFontFamily.helvetica, 12),
  bounds: Rect.fromLTWH(
    textX, // Posición X del texto
    texty2, // Posición Y del texto (debajo del primer texto)
    whiteRectWidth, // Ancho del texto (mismo que el rectángulo blanco)
    50, // Alto del texto
  ),
  brush: PdfSolidBrush(PdfColor(0, 0, 0)), // Color negro para el texto
  format: PdfStringFormat(
    alignment: PdfTextAlignment.justify,
    lineAlignment: PdfVerticalAlignment.middle,
  ),
);

const String textin1 = 'Copyright  2024  Programers ZGL ';
const String textin2 = '+52-380-963-97';
const String textin3 = '¿ Cualquier duda ?  support@SMICCAT.com';


final double txtX = (pageSize.width - rectWidth) / 2 + sectionWidth + spaceBetweenSections + (sectionWidth - whiteRectWidth) / 2; // Posición X de los textos
final double txtY1 = ((pageSize.height - 600) / 2) + 220 + rectHeight + 20; // Posición Y del primer texto debajo de los rectángulos
final double txtY2 = txtY1 + 30; // Posición Y del segundo texto debajo del primer texto
final double txtY3 = txtY2 + 30; // Posición Y del tercer texto debajo del segundo texto

// Texto debajo del primer rectángulo azul
page.graphics.drawString(
  textin1,
  PdfStandardFont(PdfFontFamily.helvetica, 12),
  bounds: Rect.fromLTWH(
    txtX, // Posición X del texto
    txtY1, // Posición Y del primer texto (debajo del primer rectángulo azul)
    whiteRectWidth, // Ancho del texto (mismo que el rectángulo blanco)
    30, // Alto del texto
  ),
  brush: PdfSolidBrush(PdfColor(0, 0, 0)), // Color negro para el texto
  format: PdfStringFormat(
    alignment: PdfTextAlignment.right,
    lineAlignment: PdfVerticalAlignment.top,
  ),
);

// Texto debajo del segundo rectángulo azul
page.graphics.drawString(
  textin2,
  PdfStandardFont(PdfFontFamily.helvetica, 12),
  bounds: Rect.fromLTWH(
    txtX, // Posición X del texto
    txtY2, // Posición Y del segundo texto (debajo del primer texto)
    whiteRectWidth, // Ancho del texto (mismo que el rectángulo blanco)
    30, // Alto del texto
  ),
  brush: PdfSolidBrush(PdfColor(0, 0, 0)), // Color negro para el texto
  format: PdfStringFormat(
    alignment: PdfTextAlignment.right,
    lineAlignment: PdfVerticalAlignment.middle,
  ),
);

// Texto debajo del tercer rectángulo azul
page.graphics.drawString(
  textin3,
  PdfStandardFont(PdfFontFamily.helvetica, 12),
  bounds: Rect.fromLTWH(
    txtX, // Posición X del texto
    txtY3, // Posición Y del tercer texto (debajo del segundo texto)
    whiteRectWidth, // Ancho del texto (mismo que el rectángulo blanco)
    30, // Alto del texto
  ),
  brush: PdfSolidBrush(PdfColor(0, 0, 0)), // Color negro para el texto
  format: PdfStringFormat(
    alignment: PdfTextAlignment.right,
    lineAlignment: PdfVerticalAlignment.top,
  ),
);

// page.graphics.drawEllipse(
//   Rect.fromLTWH(
//     (pageSize.width - 100) / 2, // Posición X del círculo (centrado horizontalmente)
//     ((pageSize.height - 600) / 2) + 400, // Posición Y del círculo (ajustar según tu diseño)
//     100, // Ancho del círculo
//     100, // Alto del círculo
//   ),
//   pen: PdfPen(PdfColor(0, 0, 0), width: 2), // Color y grosor del borde del círculo
//   brush: PdfSolidBrush(PdfColor(255, 0, 0)), // Color de relleno del círculo
// );
final PdfPen pen = PdfPen(
  PdfColor(0, 0, 0), // Color de la línea
  width: 5, // Grosor de la línea
);

// Dibujar líneas normales sin estilo específico
page.graphics.drawLine(
  pen,
  Offset(200, 100), // Punto inicial de la línea (coordenadas X e Y)
  Offset(300, 100), // Punto final de la línea (coordenadas X e Y)
);

page.graphics.drawLine(
  pen,
  Offset(300, 100), // Punto inicial de la línea (coordenadas X e Y)
  Offset(300, 120), // Punto final de la línea (coordenadas X e Y)
);

page.graphics.drawLine(
  pen,
  Offset(200, 120), // Punto inicial de la línea (coordenadas X e Y)
  Offset(240, 120), // Punto final de la línea (coordenadas X e Y)
);

page.graphics.drawLine(
  pen,
  Offset(200, 100), // Punto inicial de la línea (coordenadas X e Y)
  Offset(200, 120), // Punto final de la línea (coordenadas X e Y)
);

page.graphics.drawLine(
  pen,
  Offset(200, 120), // Punto inicial de la línea (coordenadas X e Y)
  Offset(165, 150), // Punto final de la línea (coordenadas X e Y)
);

page.graphics.drawLine(
  pen,
  Offset(300, 120), // Punto inicial de la línea (coordenadas X e Y)
  Offset(339, 150), // Punto final de la línea (coordenadas X e Y)
);

page.graphics.drawLine(
  pen,
  Offset(165, 150), // Punto inicial de la línea (coordenadas X e Y)
  Offset(165, 290), // Punto final de la línea (coordenadas X e Y)
);

page.graphics.drawLine(
  pen,
  Offset(339, 150), // Punto inicial de la línea (coordenadas X e Y)
  Offset(339, 290), // Punto final de la línea (coordenadas X e Y)
);

page.graphics.drawLine(
  pen,
  Offset(339, 150), // Punto inicial de la línea (coordenadas X e Y)
  Offset(270, 150), // Punto final de la línea (coordenadas X e Y)
);

page.graphics.drawLine(
  pen,
  Offset(165, 290), // Punto inicial de la línea (coordenadas X e Y)
  Offset(339, 290), // Punto final de la línea (coordenadas X e Y)
);
//Esto****************************************************************************
page.graphics.drawEllipse(
  Rect.fromLTWH(
    (pageSize.width - rectWidth) / 2 + 30 + (sectionWidth - whiteRectWidth) / 2, // Posición X del círculo (centrado horizontalmente)
    ((pageSize.height - 720) / 2) + 240 + (rectHeight - whiteRectHeight) / 2, // Posición Y del círculo (ajustar según tu diseño)
    100, // Ancho del círculo
    100, // Alto del círculo
  ),
  pen: PdfPen(PdfColor(0, 83, 136), width: 40), // Color y grosor del borde del círculo (0, 83, 136), width: 2
  brush: PdfSolidBrush(PdfColor(255, 255, 255)), // Color de relleno del círculo
);


const double ancho = 120; // Ancho del nuevo rectángulo blanco
const double alto = 30; // Alto del nuevo rectángulo blanco
final double rectX = 330; // Posición X del nuevo rectángulo blanco
final double rectY = 420; // Posición Y del nuevo rectángulo blanco

page.graphics.drawRectangle(
  bounds: Rect.fromLTWH(
    rectX, // Posición X del nuevo rectángulo blanco
    rectY, // Posición Y del nuevo rectángulo blanco
    ancho, // Ancho del nuevo rectángulo blanco
    alto, // Alto del nuevo rectángulo blanco
  ),
  brush: PdfSolidBrush(PdfColor(255, 0, 0)), // Color  rojo
);

page.graphics.drawRectangle(
  bounds: Rect.fromLTWH(
    rectX, // Posición X del nuevo rectángulo blanco
    rectY-40, // Posición Y del nuevo rectángulo blanco
    ancho, // Ancho del nuevo rectángulo blanco
    alto, // Alto del nuevo rectángulo blanco
  ),
  brush: PdfSolidBrush(PdfColor(255, 255, 0)), // Color amarillo
);

page.graphics.drawRectangle(
  bounds: Rect.fromLTWH(
    rectX, // Posición X del nuevo rectángulo blanco
    rectY-80, // Posición Y del nuevo rectángulo blanco
    ancho, // Ancho del nuevo rectángulo blanco
    alto, // Alto del nuevo rectángulo blanco
  ),
  brush: PdfSolidBrush(PdfColor(0, 128, 0)), // Color verde
);


    // Obtener la ruta del directorio de descargas
    final Directory? downloadsDirectory = await getDownloadsDirectory();
    if (downloadsDirectory == null) {
      // Manejar el caso en el que no se pueda obtener el directorio de descargas
      print('Error: No se pudo obtener el directorio de descargas.');
      return;
    }
    final String downloadsPath = downloadsDirectory.path;

    // Guardar el PDF en la carpeta de descargas
    final File file = File('$downloadsPath/Reporte_Water_Care.pdf');
    final List<int> bytes = await document.save();
    await file.writeAsBytes(bytes);

    // Abrir el PDF después de guardarlo
    OpenFile.open('$downloadsPath/Reporte_Water_Care.pdf');
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
          GestureDetector(
            onTap:(){
              _generatePDF();
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
          ),
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
