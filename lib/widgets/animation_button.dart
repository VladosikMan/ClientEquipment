import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final Color buttonColor;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.buttonColor,
  });

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: _isHovered ? 240 : 200,
        height: _isHovered ? 70 : 60,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: widget.buttonColor.withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 3,
              offset: const Offset(0, 4),
            )
          ]
              : [],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}