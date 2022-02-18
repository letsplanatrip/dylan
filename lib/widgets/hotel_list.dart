import 'package:dylan/services/Flight.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/Train.dart';

class HotelList extends StatelessWidget {
  Train train;

  HotelList({Key? key, required this.train}) : super(key: key);

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
            children: [
              Text(
                train.source,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              Text(
                DateFormat.jm().format(train.departure),
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
                train.destination,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              Text(
                DateFormat.jm().format(train.arrival),
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: Text(
        "${train.name} ${train.id}",
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
                    train.notes,
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => {},
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
