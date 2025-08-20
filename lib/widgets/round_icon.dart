// Построение круглой иконки


import 'package:flutter/material.dart';

Widget buildRoundIcon(double width, double height) {
  return Center(
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black87,
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: const Image(
        image: AssetImage('assets/images/logo_mini.png'),
        color: null,
      ),
    ),
  );
}