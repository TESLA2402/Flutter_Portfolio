import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/home_page.dart';
import 'package:flutter_portfolio/utils/web.dart';

void main() {
  preventRightClick();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lakshay Ahlawat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: Colors.black,
      ),
      home: const HomePage(),
    );
  }
}
