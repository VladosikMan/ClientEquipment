// Построение круглой иконки
import 'package:flutter/material.dart';

Widget buildRoundIcon() {
  return Center(
    child: Container(
      width: 200,
      height: 200,
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