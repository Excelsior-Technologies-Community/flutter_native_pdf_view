import 'dart:typed_data';

import 'package:flutter_native_pdf_view/src/pdf_source_type.dart';

class PdfSource {
  final PdfSourceType type;

  final String? path;

  final Uint8List? bytes;

  final Map<String, String> headers;

  const PdfSource._({
    required this.type,
    this.path,
    this.bytes,
    this.headers = const {},
  });

  const PdfSource.asset(String asset)
    : this._(type: PdfSourceType.asset, path: asset);

  const PdfSource.network(String url, {Map<String, String> headers = const {}})
    : this._(type: PdfSourceType.network, path: url, headers: headers);

  const PdfSource.file(String file)
    : this._(type: PdfSourceType.file, path: file);

  PdfSource.memory(Uint8List bytes)
    : this._(type: PdfSourceType.memory, bytes: bytes);
}
