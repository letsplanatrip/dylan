import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class TicketViewer extends StatefulWidget {
  final File file;

  TicketViewer({required this.file, Key? key}) : super(key: key);

  @override
  State<TicketViewer> createState() => _TicketViewerState();
}

class _TicketViewerState extends State<TicketViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PDFView(
          filePath: widget.file.path,
        ),
      ),
    );
  }
}
