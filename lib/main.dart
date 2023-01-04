import 'package:flutter/material.dart';
import 'package:my_cashier/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCashier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyCashierApp(),
    );
  }
}
