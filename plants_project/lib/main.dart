import 'package:flutter/material.dart';

import 'package:plants_project/ui/screens/signin_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plants Demo',
      home:  SigninPage(),
    );
  }
}
