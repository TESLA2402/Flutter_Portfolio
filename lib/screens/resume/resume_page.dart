import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PdfViewer.openAsset(
      kReleaseMode ? 'assets/pdf/resume.pdf' : '/pdf/resume.pdf',
      params: PdfViewerParams(
          pageDecoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        boxShadow: const [
          BoxShadow(
              color: Colors.white,
              spreadRadius: 0,
              blurRadius: 5,
              blurStyle: BlurStyle.solid)
        ],
      )),
    ));
  }
}
