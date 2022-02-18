import 'dart:io';

import 'package:dylan/services/Flight.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/pdf_api.dart';
import '../pages/pdf_viewer.dart';

class FlightList extends StatefulWidget {
  Flight flight;

  FlightList({Key? key, required this.flight}) : super(key: key);

  @override
  State<FlightList> createState() => _FlightListState();
}

class _FlightListState extends State<FlightList> {
  late File ticket;

  @override
  void initState() {
    super.initState();
    // PDFApi.loadAsset('assets/pdf/boarding_pass.pdf').then((f) {
    //   setState(() {
    //     ticket = f;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    File file;
    return ExpansionTileCard(
      baseColor: Colors.grey[300],
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      leading: const CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.flight_takeoff_outlined,
          color: Colors.white,
          size: 20.0,
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                widget.flight.source,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              Text(
                DateFormat.jm().format(widget.flight.departure),
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_right_alt_rounded, color: Colors.black),
          Column(
            children: [
              Text(
                widget.flight.destination,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              Text(
                DateFormat.jm().format(widget.flight.arrival),
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: Text(
        "${widget.flight.name} ${widget.flight.id}",
        style: GoogleFonts.quicksand(
          textStyle: const TextStyle(color: Colors.black),
        ),
      ),
      children: <Widget>[
        const Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.flight.notes,
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => TicketViewer()),
                    )
                  },
                  icon: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.attachment, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
