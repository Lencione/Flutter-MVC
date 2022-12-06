import 'package:flutter/material.dart';
import 'package:navigation/views/first_page.dart';
import 'package:navigation/views/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const FirstPage(),
        '/second': (_) => const SecondPage(),
      },
    );
  }
}
