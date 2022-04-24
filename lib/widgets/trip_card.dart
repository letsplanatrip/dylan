import 'package:dylan/models/Trip.dart';
import 'package:dylan/pages/iteranary.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TripCard extends StatefulWidget {
  final Trip? trip;
  final Function()? notifyParent;

  const TripCard({Key? key, this.trip, this.notifyParent}) : super(key: key);

  @override
  State<TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: Colors.grey[300],
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      leading: const CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.card_travel,
          color: Colors.white,
          size: 20.0,
        ),
      ),
      title: Text(
        widget.trip!.name,
        style: GoogleFonts.quicksand(
          textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Text(
        DateFormat.yMMMEd().format(
                DateTime.fromMicrosecondsSinceEpoch(widget.trip!.startDate)) +
            " to " +
            DateFormat.yMMMEd().format(
                DateTime.fromMicrosecondsSinceEpoch(widget.trip!.endDate)),
        style: GoogleFonts.quicksand(
          textStyle: const TextStyle(color: Colors.black),
        ),
      ),
      trailing: IconButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => Iteranary(widget.trip!.id!)),
          )
        },
        icon: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.list, color: Colors.white),
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
                  "Description: ${widget.trip!.description}",
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
                    "Notes: ${widget.trip!.notes}",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () async => {},
                  icon: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.location_on, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () async => {},
                  icon: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
