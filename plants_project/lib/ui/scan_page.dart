import 'package:flutter/material.dart';
import 'package:plants_project/constants.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("ScanPage",style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w400,
                fontSize: 24,            
              ),),
      ),
    );
  }
}