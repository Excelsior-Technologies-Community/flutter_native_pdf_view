# Flutter Native PDF View

A lightweight, reusable Flutter package for displaying PDF documents with a clean API.

Supports Asset, Network, File and Memory PDFs while exposing a simple controller-based interface for Flutter applications.

---

## ✨ Features

- 📄 Asset PDF
- 🌐 Network PDF
- 📁 Local File PDF
- 💾 Memory (Uint8List) PDF
- 🔍 Zoom Support
- 📖 Page Navigation
- 🎯 Jump To Page
- 📊 Current Page Tracking
- ⏳ Custom Loading Widget
- ❌ Custom Error Widget
- 🧩 Reusable Controller API
- 📱 Android
- 🍎 iOS
- 🖥️ Windows (Planned)
- 🌍 Web (Planned)

---

## Installation

Add the dependency.

```yaml
dependencies:
  flutter_native_pdf_view: 
     path : ../
```

Run

```bash
flutter pub get
```

---

## Import

```dart
import 'package:flutter_native_pdf_view/flutter_native_pdf_view.dart';
```

---

## Asset PDF

```dart
final controller = NativePdfController();

NativePdfView(
  controller: controller,
  source: const PdfSource.asset(
    'assets/sample.pdf',
  ),
)
```

---

## Network PDF

```dart
NativePdfView(
  controller: controller,
  source: const PdfSource.network(
    'https://example.com/sample.pdf',
  ),
)
```

---

## File PDF

```dart
NativePdfView(
  controller: controller,
  source: PdfSource.file(
    file.path,
  ),
)
```

---

## Memory PDF

```dart
NativePdfView(
  controller: controller,
  source: PdfSource.memory(
    bytes,
  ),
)
```

---

# Controller

Create

```dart
final controller = NativePdfController();
```

### Next Page

```dart
controller.nextPage();
```

### Previous Page

```dart
controller.previousPage();
```

### Jump To Page

```dart
controller.jumpToPage(5);
```

### Zoom In

```dart
controller.zoomIn();
```

### Zoom Out

```dart
controller.zoomOut();
```

### Set Zoom

```dart
controller.setZoom(2.0);
```

---

# Current Value

```dart
controller.value.currentPage

controller.value.totalPages

controller.value.zoom

controller.value.state
```

---


# Example

```dart
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = NativePdfController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Native PDF View',
        ),
      ),
      body: NativePdfView(
        controller: controller,
        source: const PdfSource.asset(
          'assets/sample.pdf',
        ),
      ),
    );
  }
}
```

---

## License

MIT License
 
Copyright (c) 2026 Excelsior Technologies
 
Permission is hereby granted, free of charge, to any person obtaining a copy

of this software and associated documentation files (the "Software"), to deal

in the Software without restriction, including without limitation the rights

to use, copy, modify, merge, publish, distribute, sublicense, and/or sell

copies of the Software, and to permit persons to whom the Software is

furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all

copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR

IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,

FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE

AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER

LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,

OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

SOFTWARE.
 
