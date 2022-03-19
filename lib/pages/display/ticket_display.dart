import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TicketDisplay extends StatefulWidget {
  final String _ticketPath;

  const TicketDisplay(this._ticketPath, {Key? key}) : super(key: key);

  @override
  State<TicketDisplay> createState() => _TicketDisplayState();
}

class _TicketDisplayState extends State<TicketDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 1,
            child: SfPdfViewer.file(
              File(widget._ticketPath),
            ),
          ),
        ]),
      ),
    );
  }
}
