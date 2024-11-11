import 'package:flutter/material.dart';
import 'package:sneakers_store/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneakers Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, 
        ).copyWith(
          primary: Colors.blue[900], 
          secondary: Colors.blue[700], 
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
