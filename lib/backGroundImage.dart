import 'package:flutter/material.dart';

class startimage extends StatelessWidget {
  final String _assetPath;
  startimage(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        constraints: BoxConstraints.expand(
          height: 250.0,
        ),
        child: Image.asset(
          _assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
