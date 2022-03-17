import 'package:dylan/services/Flight.dart';
import 'package:dylan/widgets/iteranary/flight_card.dart';
import 'package:dylan/widgets/train_list.dart';
import 'package:flutter/material.dart';

import '../services/Train.dart';

class Iteranary extends StatefulWidget {
  const Iteranary({Key? key}) : super(key: key);

  @override
  _IteranaryState createState() => _IteranaryState();
}

class _IteranaryState extends State<Iteranary> {
  final List _flights = [
    Flight(
        "6E-751",
        "Indigo",
        "A2H9QZ",
        DateTime.parse("2021-12-24 12:35:00Z"),
        DateTime.parse("2021-12-24 13:45:00Z"),
        "CCU",
        "IXB",
        "6F",
        4536,
        "Flights to Bagdogra is a most heavily planned flight in most of the world",
        "assets/pdf/boarding_pass.pdf"
    ),
    Flight(
        "AI-747",
        "Air India",
        "A2H9QZ",
        DateTime.parse("2021-12-24 12:35:00Z"),
        DateTime.parse("2021-12-24 13:45:00Z"),
        "CCU",
        "IXB",
        "6F",
        4536,
        "Flights to Bagdogra",
        "assets/pdf/boarding_pass.pdf"
    ),
    Flight(
        "AI-747",
        "Air India",
        "A2H9QZ",
        DateTime.parse("2021-12-24 12:35:00Z"),
        DateTime.parse("2021-12-24 13:45:00Z"),
        "CCU",
        "IXB",
        "6F",
        4536,
        "Flights to Bagdogra",
        "assets/pdf/boarding_pass.pdf"
    ),
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
          backgroundColor: Colors.black,
        centerTitle: true,
          title:  TextButton.icon(
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
              onPressed: () => {}
          )
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
                  child: IteranaryFlightCard(
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
