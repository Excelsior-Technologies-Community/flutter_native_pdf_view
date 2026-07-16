import 'package:flutter/foundation.dart';
import 'package:flutter_native_pdf_view/src/pdf_value.dart';

class NativePdfController extends ValueNotifier<PdfValue> {
  NativePdfController() : super(const PdfValue());

  Future<void> nextPage() async {}

  Future<void> previousPage() async {}

  Future<void> jumpToPage(int page) async {}

  Future<void> zoomIn() async {}

  Future<void> zoomOut() async {}

  Future<void> setZoom(double zoom) async {}
}