import 'package:flutter/material.dart';

class BitTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final Widget suficon;
  final bool obscureText;
  // En clase con César (25FEB2021) se agrega este parámetro
  final TextEditingController controller;

  const BitTextField(
      {Key key,
      @required this.hintText,
      @required this.icon,
      @required this.suficon,
      // En clase con César (25FEB2021) se agrega este parámetro
      @required this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: icon,
        suffixIcon: suficon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusColor: Colors.black,
      ),
    );
  }
}
