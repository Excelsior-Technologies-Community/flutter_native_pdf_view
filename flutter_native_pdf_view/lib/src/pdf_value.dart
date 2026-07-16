import 'package:flutter/foundation.dart';
import 'package:flutter_native_pdf_view/src/pdf_state.dart';

@immutable
class PdfValue {
  final PdfState state;

  final int currentPage;

  final int totalPages;

  final double zoom;

  final String? error;

  const PdfValue({
    this.state = PdfState.loading,
    this.currentPage = 1,
    this.totalPages = 0,
    this.zoom = 1,
    this.error,
  });

  PdfValue copyWith({
    PdfState? state,
    int? currentPage,
    int? totalPages,
    double? zoom,
    String? error,
  }) {
    return PdfValue(
      state: state ?? this.state,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      zoom: zoom ?? this.zoom,
      error: error ?? this.error,
    );
  }
}
