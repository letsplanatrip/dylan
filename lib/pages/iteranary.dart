import 'package:dylan/services/Flight.dart';
import 'package:dylan/widgets/flight_list.dart';
import 'package:dylan/widgets/train_list.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../services/Train.dart';

class Iteranary extends StatefulWidget {
  const Iteranary({Key? key}) : super(key: key);

  @override
  _IteranaryState createState() => _IteranaryState();
}

class _IteranaryState extends State<Iteranary> {
  final List _flights = [
    Flight.builder(
        "6E-751",
        "Indigo",
        DateTime.parse("2021-12-24 12:35:00Z"),
        DateTime.parse("2021-12-24 13:45:00Z"),
        "CCU",
        "IXB",
        "6F",
        4536,
        "Flights to Bagdogra is a most heavily planned flight in most of the world. "),
    Flight.builder(
        "AI-747",
        "Air India",
        DateTime.parse("2021-12-24 12:35:00Z"),
        DateTime.parse("2021-12-24 13:45:00Z"),
        "CCU",
        "IXB",
        "6F",
        4536,
        "Flights to Bagdogra"),
    Flight.builder(
        "SG-406",
        "Spicejet",
        DateTime.parse("2021-12-24 12:35:00Z"),
        DateTime.parse("2021-12-24 13:45:00Z"),
        "CCU",
        "IXB",
        "6F",
        4536,
        "Flights to Bagdogra"),
  ];

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
        backgroundColor: Colors.blueAccent,
        title: Text("Iteranary"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _flights.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 1.5, 0.0, 1.5),
                  child: FlightList(
                    flight: _flights[index],
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
}