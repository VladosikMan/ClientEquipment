import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final Color buttonColor;
  final VoidCallback onPressed;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() {
          _isHovered = false;
          _isPressed = false;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: _isHovered ? 240 : 200,
          height: _isHovered ? 70 : 60,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: _isPressed
                ? widget.buttonColor.withOpacity(0.7)
                : widget.buttonColor,
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
      ),
    );
  }
}