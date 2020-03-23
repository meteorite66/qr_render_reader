import 'package:flutter/material.dart';
import 'package:qrrenderreader/pages/qr_rend_read.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR',
      home: QrRendRead(),
    );
  }
}
