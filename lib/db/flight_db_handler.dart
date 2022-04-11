import 'package:dylan/db/db_helper.dart';
import 'package:dylan/models/flight.dart';

class FlightDbHandler {
  static const String _table = "flights";

  Future<void> initFlights() async {
    final db = await DbHelper.instance.db;
    // Drop Flights
    await db?.execute("DROP TABLE IF EXISTS $_table");

    // Create Flights
    await db?.execute('''CREATE TABLE $_table (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    eventTs INTEGER NOT NULL,
    flightId TEXT NOT NULL,
    name TEXT NOT NULL,
    pnr TEXT NOT NULL,
    departure INTEGER NOT NULL,
    arrival INTEGER NOT NULL,
    source TEXT NOT NULL,
    destination TEXT NOT NULL,
    seat TEXT NOT NULL,
    fare NUMERIC NOT NULL,
    notes TEXT NOT NULL,
    ticket TEXT NOT NULL,
    tripId INTEGER NOT NULL
    )''');

    // Add Dummy Flights
    Flight f1 = Flight(
        flightId: "6E-245",
        name: "Indigo",
        pnr: "IR89XX",
        departure: DateTime.parse("2021-12-15 08:20:00").microsecondsSinceEpoch,
        arrival: DateTime.parse("2021-12-15 11:50:00").microsecondsSinceEpoch,
        source: "CCU",
        destination: "IDR",
        seat: "15A",
        fare: 4536,
        notes: "Mayank ki shaadi hai. Dhoom machayenge",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: 1);

    Flight f2 = Flight(
        flightId: "6E-507",
        name: "Indigo",
        pnr: "KM6GNJ",
        departure: DateTime.parse("2021-12-19 19:40:00").microsecondsSinceEpoch,
        arrival: DateTime.parse("2021-12-19 20:55:00").microsecondsSinceEpoch,
        source: "VNS",
        destination: "CCU",
        seat: "6F",
        fare: 4711,
        notes: "Home Sweet Home... Home is calling",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: 1);

    await createFlight(f1);
    await createFlight(f2);
  }

  Future<Flight> createFlight(Flight flight) async {
    final db = await DbHelper.instance.db;
    final id = await db?.insert(_table, flight.toJSON());
    return flight.copy(id: id);
  }

  Future<Flight> updateFlight(Flight flight) async {
    final db = await DbHelper.instance.db;
    await db?.update(_table, flight.toJSON(),
        where: "id = ?", whereArgs: [flight.id]);
    return flight;
  }

  Future<Flight?> getFlightById(int id) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result =
        await db?.query(_table, where: "id = ?", whereArgs: [id]);
    return result
        ?.map((flightJSON) => Flight.fromJSON(flightJSON))
        .toList()
        .first;
  }

  Future<List<Flight?>?> getFlightsForTrip(int tripId) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result = await db?.query(_table,
        where: "tripId = ?", whereArgs: [tripId], orderBy: "eventTs ASC");
    result?.map((flightJSON) => print(flightJSON));
    return result?.map((flightJSON) => Flight.fromJSON(flightJSON)).toList();
  }

  Future<List<Flight?>?> getFlightsForTripAndDate(int tripId, int ts) async {
    final db = await DbHelper.instance.db;
    int startTs = ts;
    int endTs = ts + 86400000000 - 1;
    List<Map<String, Object?>>? result = await db?.query(_table,
        where: "tripId = ? AND eventTs >= ? AND eventTs <= ?",
        whereArgs: [tripId, startTs, endTs],
        orderBy: "eventTs ASC");
    return result?.map((flightJSON) => Flight.fromJSON(flightJSON)).toList();
  }
}
