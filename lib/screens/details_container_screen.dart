import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:firebase_database/firebase_database.dart';

class DetailsContainer extends StatefulWidget {
  const DetailsContainer({super.key});

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  Stream<DatabaseEvent>? _dataStream;
  @override
  void initState(){
    super.initState();
    _dataStream = database.ref().child('datos').onValue;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More information about.'),
      ),
      body: Stack(
        children: [
          Positioned( // Position the drawing on top
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: CustomPaint(
                size: const Size(400, 400),
                painter: MyPainter(),
              ),
            ),
          ),
          Positioned( 
            // Position the StreamBuilder below the drawing
            bottom: 250.0,
            left: 40.0,
            right: 20.0,
            child: StreamBuilder<DatabaseEvent>(
              stream: _dataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final String dataString = snapshot.data!.snapshot.value as String;
                  return Text('Cantidad: '+dataString+ '\nCalidad:'+dataString, style: TextStyle(fontSize: 15),);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint( //                       <-- CustomPaint widget
        size: const Size(400, 400),
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
void paint(Canvas canvas, Size size) {
  final p1 = Offset(120, 20);//A
  final p2 = Offset(240, 20);//B
  final paint1 = Paint()
    ..color = Colors.black
    ..strokeWidth = 5;
  canvas.drawLine(p1, p2, paint1);

  // final p3 = Offset(270, 20);//B
  final p4 = Offset(240, 65);//C
  final paint2 = Paint()
    ..color = Colors.black
    ..strokeWidth = 5;
  canvas.drawLine(p2, p4, paint2);


  final p5 = Offset(310, 135);//D
  final paint3 = Paint()
    ..color = Colors.black
    ..strokeWidth = 5;
  canvas.drawLine(p4, p5, paint3);

  final p6 = Offset(310, 300);//E
  final paint4 = Paint()
    ..color = Colors.black
    ..strokeWidth = 5;
  canvas.drawLine(p5, p6, paint4);
  
  final p7 = Offset(50, 300);//F
  final p8 = Offset(50, 135);//G
  final paint6 = Paint()
    ..color = Color.fromARGB(255, 0, 0, 0)
    ..strokeWidth = 5;
  canvas.drawLine(p7, p8, paint6);

  final p9 = Offset(120, 65);//H
  final paint7 = Paint()
    ..color = Color.fromARGB(255, 0, 0, 0)
    ..strokeWidth = 5;
  canvas.drawLine(p8, p9, paint7);


  final paint8 = Paint()
    ..color = Colors.black
    ..strokeWidth = 5;
  canvas.drawLine(p9, p1, paint8);


final path = Path()
    ..moveTo(310, 299)
    // ..lineTo(340, 300)
    ..quadraticBezierTo(180, 360, 50, 299);
  final paintx = Paint()
    ..color = ui.Color.fromARGB(255, 0, 0, 0)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 6;
  canvas.drawPath(path, paintx);


}
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
