import 'package:dylan/pages/forms/flight_form.dart';
import 'package:dylan/pages/display/ticket_display.dart';
import 'package:dylan/models/flight.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class IteranaryFlightCard extends StatefulWidget {
  final Flight? flight;
  final Function()? notifyParent;

  const IteranaryFlightCard({Key? key, this.flight, this.notifyParent}) : super(key: key);

  @override
  State<IteranaryFlightCard> createState() => _IteranaryFlightCardState();
}

class _IteranaryFlightCardState extends State<IteranaryFlightCard> {
  late Flight _flight;

  @override
  void initState() {
    super.initState();
    _flight = widget.flight!;
  }

  @override
  Widget build(BuildContext context) {
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
                _flight.source,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              Text(
                DateFormat.jm().format(
                    DateTime.fromMicrosecondsSinceEpoch(_flight.departure)),
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
                _flight.destination,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              Text(
                DateFormat.jm().format(
                    DateTime.fromMicrosecondsSinceEpoch(_flight.arrival)),
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: Text(
        "${_flight.name} ${_flight.flightId}",
        style: GoogleFonts.quicksand(
          textStyle: const TextStyle(color: Colors.black),
        ),
      ),
      children: <Widget>[
        const Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "PNR: ${_flight.pnr}",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Seat: ${_flight.seat}",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Fare: Rs. ${_flight.fare}",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
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
                    _flight.notes,
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () async =>
                  {
                    _flight = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => FlightForm(_flight)),
                    ),
                    widget.notifyParent!()
                  },
                  icon: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => TicketDisplay(_flight.ticket)),
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
