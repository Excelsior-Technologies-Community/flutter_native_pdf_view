import 'package:flutter/material.dart';
import 'package:flutter_native_pdf_view/flutter_native_pdf_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PdfScreen());
  }
}

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Native PDF View')),
     body: NativePdfView(
  controller: NativePdfController(),
  source: const PdfSource.asset('assets/documents/Practical_Task.pdf'),
),
    );
  }
}
