
import 'package:flutter/material.dart';
import 'package:plants_project/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String text;
  final bool obscure;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.icon,
    required this.text,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Constants.blackColor.withOpacity(.7),
      ),
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Constants.blackColor.withOpacity(.3),
        ),
        hintText: text,
        border: InputBorder.none,
      ),
      cursorColor: Constants.primaryColor.withOpacity(.3),
    );
  }
}
