import 'package:flutter/material.dart';

class CustomCip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height * 2, size.width, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width / 2, size.height * 2 - 7, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
