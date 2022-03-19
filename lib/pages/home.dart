import 'package:dylan/db/flight_db_handler.dart';
import 'package:dylan/db/train_db_handler.dart';
import 'package:dylan/models/Flight.dart';
import 'package:dylan/models/Train.dart';
import 'package:dylan/pages/iteranary.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Flight?>? flights;
    List<Train?>? trains;
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () => {initDB()},
              child: const Text("Initialize")),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () async => {
                    flights = await getFlights(),
                    trains = await getTrains(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Iteranary(
                          flights, trains
                        ),
                      ),
                    )
                  },
              child: const Text("Iteranary")),
        ],
      ),
    );
  }

  Future<List<Flight?>?> getFlights() async {
    return await FlightDbHandler().getFlightsForTrip("trip001");
  }

  Future<List<Train?>?> getTrains() async {
    return await TrainDbHandler().getTrainsForTrip("trip001");
  }

  Future<void> initDB() async {
    await FlightDbHandler().initFlights();
    await TrainDbHandler().initTrains();
  }
}
