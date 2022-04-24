import 'package:dylan/db/flight_db_handler.dart';
import 'package:dylan/db/hotel_db_handler.dart';
import 'package:dylan/db/train_db_handler.dart';
import 'package:dylan/db/trip_db_handler.dart';
import 'package:dylan/models/Trip.dart';
import 'package:dylan/models/flight.dart';
import 'package:dylan/models/train.dart';
import 'package:dylan/pages/iteranary.dart';
import 'package:dylan/widgets/trip_card.dart';
import 'package:flutter/material.dart';

import '../widgets/home_sidebar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<Trip?>? _trips;

  @override
  void initState() {
    getTrips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Flight?>? flights;
    List<Train?>? trains;
    return Scaffold(
      drawer: HomeSidebar(),
      appBar: AppBar(
        title: const Text("home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TripCard(trip: _trips![0]),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Iteranary(1),
                      ),
                    )
                  },
              child: const Text("Iteranary")),
        ],
      ),
    );
  }

  Future<void> getTrips() async {
    _trips = await TripDbHandler().getAllTrips();
  }

  Future<void> initDB() async {
    await TripDbHandler().initTrips();
    await FlightDbHandler().initFlights();
    await TrainDbHandler().initTrains();
    await HotelDbHandler().initHotels();
  }
}
