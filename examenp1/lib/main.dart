import 'package:flutter/material.dart';
import 'pantallas/pantalla_bienvenida.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clasificador de Grupos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PantallaBienvenida(),
    );
  }
}
