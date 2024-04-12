import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:firebase_database/firebase_database.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DetailsContainer extends StatefulWidget {
  const DetailsContainer({super.key});

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  Stream<DatabaseEvent>? _dataStream1;
  Stream<DatabaseEvent>? _dataStream2;

  @override
  void initState() {
    super.initState();
    final ref1 = database.ref().child('cantidad');
    final ref2 = database.ref().child('calidad');
    _dataStream1 = ref1.onValue;
    _dataStream2 = ref2.onValue;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More information about.'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: CustomPaint(
                size: const Size(400, 400),
                painter: MyPainter(),
              ),
            ),
          ),Positioned(
            bottom: 280.0, // Adjust positioning as needed
            left: 40.0,
            right: 20.0,
            child: StreamBuilder<DatabaseEvent>(
              stream: _dataStream1,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final String data1 = snapshot.data!.snapshot.value as String; // Handle missing data if necessary
                  return Text(
                    data1,
                    style: const TextStyle(fontSize: 15),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),

          Positioned(
           bottom: 260.0, // Adjust positioning as needed
            left: 40.0,
            right: 20.0,
            child: StreamBuilder<DatabaseEvent>(
              stream: _dataStream2,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final String data2 = snapshot.data!.snapshot.value as String; // Handle missing data if necessary
                  // ... use data2 for further processing or display
                  return Text(data2, style: TextStyle(fontSize: 15),); // Placeholder (replace with your content)
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
//           StreamBuilder<DatabaseEvent>(
//   stream: _dataStream2,
//   builder: (context, snapshot) {
//     String data2;
//     double data2Value;
//     if (snapshot.hasData) {
//       data2 = snapshot.data!.snapshot.value as String;
//       if (data2 != null) {
//         data2Value = double.parse(data2);
//       }else {
//         print("data2 es nulo, no se puede convertir a double");
//         data2Value = 0.0;
//       }
//     } else if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     }
//     return Center(child: CircularProgressIndicator());
//   },
// ),
Positioned(
          top: 450,
          right: 100,
          child: Container(
            width: 150,
            height: 150,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: -1300,
                  maximum: 3000,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: -1300,
                      endValue: 0,
                      color: Colors.green,
                    ),
                    GaugeRange(
                      startValue: 0,
                      endValue: 999,
                      color: Colors.orange,
                    ),
                    GaugeRange(
                      startValue: 1000,
                      endValue: 2999,
                      color: Colors.red,
                    ),
                  ],
                  pointers: const <GaugePointer>[
                    NeedlePointer(
                      value: 2,
                      enableAnimation: true,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Container(
                        child: const Text(
                          "0",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
          Positioned(top: 620,
          right: 0,
            child: Container(
            
            child: Center(
              child: GestureDetector(
                
      onTap: () async {
        //  await FirebaseFirestore.instance
        //         .collection('contenedores')
        //         .doc(contenedor['id'])
        //         .delete();

        // 4. Navegar a la pantalla de inicio (opcional)
       Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()),
                );
      },
      child: Container(
        padding: const EdgeInsets.all(15),//tamaño del boton vertical
        margin: const EdgeInsets.symmetric(horizontal: 120),//tamaño del boton horizontal
        decoration:  BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(25)),//border
        child: const Center(
          child: Text('Delete container',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
          ),
      ),
    ),
            ),
          )),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(120, 20);
    final p2 = Offset(240, 20);
    final paint1 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(p1, p2, paint1);

    final p4 = Offset(240, 65);
    final paint2 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(p2, p4, paint2);

    final p5 = Offset(310, 135);
    final paint3 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(p4, p5, paint3);

    final p6 = Offset(310, 300);
    final paint4 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(p5, p6, paint4);

    final p7 = Offset(50, 300);
    final p8 = Offset(50, 135);
    final paint6 = Paint()
      ..color = Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = 5;
    canvas.drawLine(p7, p8, paint6);

    final p9 = Offset(120, 65);
    final paint7 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = 5;
    canvas.drawLine(p8, p9, paint7);

    final paint8 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(p9, p1, paint8);

    final path = Path()
      ..moveTo(310, 299)
      ..quadraticBezierTo(180, 360, 50, 299);
    final paintx = Paint()
      ..color = const ui.Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawPath(path, paintx);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
