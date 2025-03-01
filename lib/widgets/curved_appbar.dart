import 'package:flutter/material.dart';

class CurvedAppBar extends StatelessWidget {
  const CurvedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WavyAppBarClipper(),
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber[300]!, Colors.amber[900]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}

class WavyAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width * 0.2, size.height - 120, size.width * 0.60, size.height - 60);
    path.quadraticBezierTo(size.width * 0.75, size.height - 20, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
