import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/main_page.dart';
import 'package:flutter_portfolio/utils/web.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  preventRightClick();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 1060, name: MOBILE),
          const Breakpoint(start: 1061, end: 1200, name: TABLET),
          const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Lakshay Ahlawat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: Colors.black,
      ),
      home: const MainPage(),
    );
  }
}
