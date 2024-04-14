import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:firebase_database/firebase_database.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DetailsContainer extends StatefulWidget {
  const DetailsContainer({Key? key}) : super(key: key);

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  Stream<DatabaseEvent>? _dataStream1;
  Stream<DatabaseEvent>? _dataStream11;
  Stream<DatabaseEvent>? _dataStream2;
  Stream<DatabaseEvent>? _dataStream22;

  @override
  void initState() {
    super.initState();
    final ref1 = database.ref().child('cantidad');
    final ref2 = database.ref().child('calidad');
    _dataStream1 = ref1.onValue;
    _dataStream11 = ref1.onValue;
    _dataStream2 = ref2.onValue;
    _dataStream22 = ref2.onValue;
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
  child: 
  StreamBuilder<DatabaseEvent>(
              stream: _dataStream11,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final String? dataString =
                      snapshot.data!.snapshot.value.toString();
                  if (dataString != null) {
                    double dataDouble = double.parse(dataString);
                    String percentageString = '';
                    if (dataDouble >= 0 && dataDouble <= 1000) {
                      percentageString = dataDouble <= 1000 ? '${(dataDouble / 10).toStringAsFixed(2)}%' : 'N/A%';
                    } else if(dataDouble > 1000) {
                      percentageString = 'N/A';
                    }else if(dataDouble<0){
                      percentageString = "N/A";
                    }
                    return Center(
                      child: CustomPaint(
                        size: const Size(400, 400),
                        painter: MyPainter(percentageString),
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          
          ),
      

          Positioned(
            bottom: 330.0,
            left: 30.0,
            right: 20.0,
            child: StreamBuilder<DatabaseEvent>(
              stream: _dataStream1,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final String data1 =
                      snapshot.data!.snapshot.value.toString();
                  return Column(
                    children: [
                      Text(
                        ""
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
           Positioned(
              top: 410,
              right: 100,
              child: Container(
                width: 150,
                height: 150,
                child: StreamBuilder<DatabaseEvent>(
                  stream: _dataStream22,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final String data2 =
                          snapshot.data!.snapshot.value.toString();
                          double dataD = double.parse(data2);
                          return SfRadialGauge(
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
                              pointers:  <GaugePointer>[
                                NeedlePointer(
                                  value:dataD,
                                  enableAnimation: true,
                                ),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Container(
                                    child:  Text("\n\n"+
                                      data2,
                                      style: TextStyle(
                                        fontSize: 14,
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
                        );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
                
                  }
                ),
                
              ),
            ),
          Positioned(
            bottom: 120.0,
            left: 30.0,
            right: 20.0,
            child: StreamBuilder<DatabaseEvent>(
              stream: _dataStream2,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final String data2 =
                      snapshot.data!.snapshot.value.toString();
                  return Column(
                    children: [
                      Text("NTU: "+data2 ?? '', style: const TextStyle(fontSize: 18)),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Positioned(
            top: 620,
            right: 0,
            child: Container(
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 120),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Delete container',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final String text;
  MyPainter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset(120, 20);
    const p2 = Offset(240, 20);
    final paint1 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(p1, p2, paint1);

    const p4 = Offset(240, 65);
    final paint2 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(p2, p4, paint2);

    const p5 = Offset(310, 135);
    final paint3 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(p4, p5, paint3);

    const p6 = Offset(310, 300);
    final paint4 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(p5, p6, paint4);

    const p7 = Offset(50, 300);
    const p8 = Offset(50, 135);
    final paint6 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = 5;
    canvas.drawLine(p7, p8, paint6);

    const p9 = Offset(120, 65);
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
    final textPainter = TextPainter(
      text: TextSpan(
        text: text.toString(), // Set the text content
        style: const TextStyle(
          color: Colors.black, // Adjust text color and style
          fontSize: 50.0,
        ),
      ),
      textAlign: TextAlign.center, // Optional: Set text alignment
    );
    textPainter.textDirection = TextDirection.ltr;
    // Layout the text painter to determine its size
    textPainter.layout(minWidth: 0, maxWidth: size.width);

    // Calculate the position for the text based on your drawing
    final textOffset = Offset(
      (size.width - textPainter.width) / 2, // Center the text horizontally
      // Adjust the vertical position according to your drawing (e.g., below the triangle)
      p6.dy -150, // Position the text below point p6 with some padding
    );

    // Paint the text on the canvas at the calculated position
    textPainter.paint(canvas, textOffset);
  
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return text != (oldDelegate as MyPainter).text;
  }
}
