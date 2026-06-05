import 'package:flutter/cupertino.dart';

class ElevatedNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double buttonRadius = 40;
    double centerX = size.width / 2;

    // 🔹 ADJUST THIS VALUE:
    // -20 will make a shallow, low hump.
    // -40 makes a high, prominent hump.
    double notchHeight = -35;

    path.lineTo(centerX - (buttonRadius * 1.5), 0);

    // The Curve
    path.cubicTo(
      centerX - buttonRadius, 0,
      centerX - buttonRadius, notchHeight, // Peak height start
      centerX, notchHeight,                // Actual peak
    );
    path.cubicTo(
      centerX + buttonRadius, notchHeight, // Peak height end
      centerX + buttonRadius, 0,
      centerX + (buttonRadius * 1.5), 0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}