import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

import 'pdf_controller.dart';
import 'pdf_error.dart';
import 'pdf_loading.dart';
import 'pdf_source.dart';
import 'pdf_source_type.dart';
import 'pdf_state.dart';

class NativePdfView extends StatefulWidget {
  final NativePdfController? controller;
  final PdfSource source;

  const NativePdfView({super.key, this.controller, required this.source});

  @override
  State<NativePdfView> createState() => _NativePdfViewState();
}

class _NativePdfViewState extends State<NativePdfView> {
  late final NativePdfController _controller;
  late Future<PdfDocument> _documentFuture;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? NativePdfController();
    _documentFuture = _loadDocument();
  }

  Future<PdfDocument> _loadDocument() async {
    try {
      final doc = switch (widget.source.type) {
        PdfSourceType.asset => await PdfDocument.openAsset(widget.source.path!),
        PdfSourceType.file => await PdfDocument.openFile(widget.source.path!),
        PdfSourceType.memory => await PdfDocument.openData(
          widget.source.bytes!,
        ),
        PdfSourceType.network => throw UnimplementedError(
          'Network source not implemented yet',
        ),
      };

      _controller.value = _controller.value.copyWith(
        state: PdfState.ready,
        totalPages: doc.pagesCount,
      );
      return doc;
    } catch (e) {
      _controller.value = _controller.value.copyWith(
        state: PdfState.error,
        error: e.toString(),
      );
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PdfDocument>(
      future: _documentFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return PdfError(message: snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const PdfLoading();
        }

        return PdfView(
          controller: PdfController(document: Future.value(snapshot.data!)),
          onDocumentLoaded: (document) {
            debugPrint('Loaded ${document.pagesCount} pages');
          },
          onDocumentError: (error) {
            debugPrint('PDF ERROR: $error');
          },
        );
      },
    );
  }
}
