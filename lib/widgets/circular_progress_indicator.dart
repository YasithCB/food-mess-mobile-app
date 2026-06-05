import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 3.5,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
