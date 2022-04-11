import 'package:dylan/pages/forms/flight_form.dart';
import 'package:dylan/pages/display/ticket_display.dart';
import 'package:dylan/models/flight.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class IteranaryDateCard extends StatefulWidget {
  final int date;

  const IteranaryDateCard({Key? key, required this.date}) : super(key: key);

  @override
  State<IteranaryDateCard> createState() => _IteranaryDateCardState();
}

class _IteranaryDateCardState extends State<IteranaryDateCard> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const SizedBox(height: 20,),
      const Expanded(child: Divider(
        color: Colors.black,
        thickness: 1.2,
      )),
      const SizedBox(width: 10,),
      Text(
          DateFormat.yMMMMEEEEd().format(DateTime.fromMicrosecondsSinceEpoch(widget.date)),
        style: GoogleFonts.quicksand(
          textStyle: const TextStyle(color: Colors.black),
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
      ),
      const SizedBox(width: 10,),
      const Expanded(child: Divider(
        color: Colors.black,
        thickness: 1.2,
      )),
      const SizedBox(height: 20,),
    ]);
  }
}
