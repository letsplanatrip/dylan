import 'package:dylan/models/hotel.dart';
import 'package:dylan/pages/display/ticket_display.dart';
import 'package:dylan/pages/forms/hotel_form.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class IteranaryHotelCard extends StatefulWidget {
  final Hotel? hotel;
  final int? date;
  final Function()? notifyParent;

  const IteranaryHotelCard({Key? key, this.date, this.hotel, this.notifyParent})
      : super(key: key);

  @override
  State<IteranaryHotelCard> createState() => _IteranaryHotelCardState();
}

class _IteranaryHotelCardState extends State<IteranaryHotelCard> {
  late Hotel _hotel;

  @override
  void initState() {
    super.initState();
    _hotel = widget.hotel!;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: Colors.grey[300],
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      leading: const CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.hotel_outlined,
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
                _hotel.name,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              getHotelStatus(),
            ],
          ),
        ],
      ),
      trailing: Text(
        _hotel.city,
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
                  "Room: ${_hotel.roomNumber}",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Fare: Rs. ${_hotel.fare}",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Phone: ${_hotel.phone}",
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
                    _hotel.notes,
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
                    _hotel = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => HotelForm(_hotel)),
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
                          builder: (context) => TicketDisplay(_hotel.ticket)),
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

  Widget getHotelStatus() {
    if (widget.hotel!.checkIn >= widget.date! &&
        widget.hotel!.checkIn < widget.date! + 86400000000 &&
        widget.hotel!.checkOut >= widget.date! &&
        widget.hotel!.checkOut < widget.date! + 86400000000) {
      return Row(
        children: [
          Text(
              "CheckIn: " +
                  DateFormat.jm().format(
                      DateTime.fromMicrosecondsSinceEpoch(_hotel.checkIn)),
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(color: Colors.black),
              )),
          Text(
              "CheckOut: " +
                  DateFormat.jm().format(
                      DateTime.fromMicrosecondsSinceEpoch(_hotel.checkOut)),
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(color: Colors.black),
              )),
        ],
      );
    } else if (widget.hotel!.checkIn >= widget.date! &&
        widget.hotel!.checkIn < widget.date! + 86400000000) {
      return Text(
          "CheckIn: " +
              DateFormat.jm()
                  .format(DateTime.fromMicrosecondsSinceEpoch(_hotel.checkIn)),
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(color: Colors.black),
          ));
    } else if (widget.hotel!.checkOut >= widget.date! &&
        widget.hotel!.checkOut < widget.date! + 86400000000) {
      return Text(
          "CheckOut: " +
              DateFormat.jm()
                  .format(DateTime.fromMicrosecondsSinceEpoch(_hotel.checkOut)),
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(color: Colors.black),
          ));
    }
    return Text("Stay in Hotel",
        style: GoogleFonts.quicksand(
            textStyle: const TextStyle(color: Colors.black)));
  }
}
