import 'package:flutter/material.dart';

class PdfError extends StatelessWidget {
  final String message;

  const PdfError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message, textAlign: TextAlign.center));
  }
}
