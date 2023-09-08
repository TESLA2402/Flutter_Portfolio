import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PdfViewer.openAsset(
            kReleaseMode ? 'assets/assets/pdf/resume.pdf' : '/pdf/resume.pdf'));
  }
}
