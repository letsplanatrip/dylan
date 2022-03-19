import 'package:dylan/db/flight_db_handler.dart';
import 'package:dylan/models/Train.dart';
import 'package:dylan/widgets/flight_card.dart';
import 'package:dylan/widgets/train_list.dart';
import 'package:flutter/material.dart';

import '../models/Flight.dart';

class Iteranary extends StatefulWidget {
  final List<Flight?>? _flights;

  const Iteranary(this._flights, {Key? key}) : super(key: key);

  @override
  _IteranaryState createState() => _IteranaryState();
}

class _IteranaryState extends State<Iteranary> {
  final List _trains = [
    Train.builder(
        "12342",
        "Duronto",
        DateTime.parse("2021-12-24 12:35:00Z"),
        DateTime.parse("2021-12-24 13:45:00Z"),
        "HWH",
        "YPR",
        "CNF/SU/34",
        4536,
        "Train to Bangalore "),
    Train.builder(
        "12342",
        "Duronto",
        DateTime.parse("2021-12-24 12:35:00Z"),
        DateTime.parse("2021-12-24 13:45:00Z"),
        "HWH",
        "YPR",
        "CNF/LB/32",
        4536,
        "Train to Bangalore "),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.black,
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
      body: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget._flights?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 1.5, 0.0, 1.5),
                  child: IteranaryFlightCard(
                    flight: widget._flights![index],
                  ),
                );
              }),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _trains.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 1.5, 0.0, 1.5),
                  child: TrainList(
                    train: _trains[index],
                  ),
                );
              }),
        ],
      ),
    );
  }

  Future<List<Flight?>?> getFlightsForTrip(String tripId) async {
    List<Flight?>? flights = await FlightDbHandler().getFlightsForTrip(tripId);
    return flights;
  }
}
