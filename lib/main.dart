import 'package:flutter/material.dart';
import 'package:simple_shopping_app/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shopify App',
      home: HomePage(),
    );
  }
}
