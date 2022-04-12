import 'package:dylan/models/train.dart';
import 'package:dylan/pages/display/ticket_display.dart';
import 'package:dylan/pages/forms/train_form.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class IteranaryTrainCard extends StatefulWidget {
  final Train? train;
  final Function()? notifyParent;

  const IteranaryTrainCard({Key? key, required this.train, this.notifyParent}) : super(key: key);

  @override
  State<IteranaryTrainCard> createState() => _IteranaryTrainCardState();
}

class _IteranaryTrainCardState extends State<IteranaryTrainCard> {

  late Train _train;

  @override
  void initState() {
    super.initState();
    _train = widget.train!;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: Colors.grey[300],
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      leading: const CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.train_outlined,
          color: Colors.white,
          size: 20.0,
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _train.source,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              Text(
                DateFormat.jm().format(DateTime.fromMicrosecondsSinceEpoch(
                    _train.departure)),
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_right_alt_rounded, color: Colors.black),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _train.destination,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              Text(
                DateFormat.jm().format(
                    DateTime.fromMicrosecondsSinceEpoch(_train.arrival)),
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: Text(
        "${_train.name} ${_train.trainId}",
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
                  "PNR: ${_train.pnr}",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Seat: ${_train.compartment}/${_train.seat}/${_train.berth}",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Fare: Rs. ${_train.fare}",
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
                    _train.notes,
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () async => {
                    _train = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => TrainForm(_train)),
                    ),
                    widget.notifyParent!()
                  },
                  icon: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              TicketDisplay(_train.ticket)),
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
