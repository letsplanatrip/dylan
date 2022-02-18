import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TicketViewer extends StatefulWidget {
  @override
  State<TicketViewer> createState() => _TicketViewerState();
}

class _TicketViewerState extends State<TicketViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 1,
            child: SfPdfViewer.asset(
              "assets/boarding_pass.pdf",
            ),
          ),
        ]),
      ),
    );
  }
}
