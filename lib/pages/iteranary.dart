import 'dart:async';

import 'package:dylan/db/flight_db_handler.dart';
import 'package:dylan/db/hotel_db_handler.dart';
import 'package:dylan/db/train_db_handler.dart';
import 'package:dylan/db/trip_db_handler.dart';
import 'package:dylan/models/Trip.dart';
import 'package:dylan/models/flight.dart';
import 'package:dylan/models/hotel.dart';
import 'package:dylan/models/train.dart';
import 'package:dylan/widgets/collapsable_date_card.dart';
import 'package:dylan/widgets/flight_card.dart';
import 'package:dylan/widgets/hotel_card.dart';
import 'package:dylan/widgets/train_card.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class Iteranary extends StatefulWidget {
  final int tripId;

  const Iteranary(this.tripId, {Key? key}) : super(key: key);

  @override
  _IteranaryState createState() => _IteranaryState();
}

class _IteranaryState extends State<Iteranary> {
  static final _log = Logger('Iteranary');

  late Trip _trip;
  Map<int, List<dynamic>?> _iteranaryList = {};

  @override
  void initState() {
    _log.fine("Initialize Iteranary");
    _initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: TextButton.icon(
              icon: const Icon(
                Icons.list,
                color: Colors.white,
              ),
              label: const Text(
                "Iteranary",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () => {})),
      body: SingleChildScrollView(
        child: _getIteranaryColumn(),
      ),
    );
  }

  Widget card(int key, Object obj) {
    if (obj is Flight) {
      return IteranaryFlightCard(
        flight: obj,
        notifyParent: refresh,
      );
    } else if (obj is Train) {
      return IteranaryTrainCard(
        train: obj,
        notifyParent: refresh,
      );
    } else if (obj is Hotel) {
      return IteranaryHotelCard(
        date: key,
        hotel: obj,
        notifyParent: refresh,
      );
    }
    return const SizedBox(
      height: 0,
    );
  }

  FutureOr<void> _initialize() async {
    Map<int, List<dynamic>?> iteranaryList = {};
    List<Flight?>? flights = [];
    List<Train?>? trains = [];
    List<Hotel?>? hotels = [];
    List iteranary = [];

    _trip = (await TripDbHandler().getTripById(widget.tripId))!;
    _log.fine(_trip.toJSON());
    for (int ts = _trip.startDate; ts <= _trip.endDate; ts += 86400000000) {
      flights = await FlightDbHandler().getFlightsForTripAndDate(_trip.id!, ts);
      trains = await TrainDbHandler().getTrainsForTripAndDate(_trip.id!, ts);
      hotels = await HotelDbHandler().getHotelsForTripAndDate(_trip.id!, ts);
      iteranary = [...?flights, ...?trains, ...?hotels];
      iteranary.sort((a, b) => a.eventTs.compareTo(b.eventTs));
      iteranaryList[ts] = iteranary;
    }
    setState(() {
      _iteranaryList = iteranaryList;
    });
  }

  Widget _getIteranaryColumn() {
    List<Widget> columnEntries = [];
    _iteranaryList.forEach((key, value) {
      columnEntries.add(CollapsableDateCard(
          date: key,
          iteranaryList: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: value!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 3, 10, 2),
                  child: card(key, value[index]),
                );
              })));
      columnEntries.add(const SizedBox(height: 5));
    });

    return Column(children: columnEntries);
  }

  refresh() {
    _log.finest("Refreshing the UI");
    setState(() {});
  }
}
