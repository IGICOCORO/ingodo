import 'package:flutter/material.dart';
import 'package:ingodo_manager/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ingodo Yanje',
      initialRoute: splash,
    );
  }
}