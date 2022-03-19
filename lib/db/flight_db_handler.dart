import 'package:dylan/db/db_helper.dart';
import 'package:dylan/models/Flight.dart';

class FlightDbHandler {
  static const String _table = "flights";

  Future<void> initFlights() async {
    final db = await DbHelper.instance.db;
    // Drop Flights
    await db?.execute("DROP TABLE IF EXISTS $_table");

    // Create Flights
    await db?.execute('''CREATE TABLE $_table (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    flightId TEXT NOT NULL,
    name TEXT NOT NULL,
    pnr TEXT NOT NULL,
    departure INTEGER NOT NULL,
    arrival INTEGER NOT NULL,
    source TEXT NOT NULL,
    destination TEXT NOT NULL,
    seat TEXT NOT NULL,
    fare INTEGER NOT NULL,
    notes TEXT NOT NULL,
    ticket TEXT NOT NULL,
    tripId TEXT NOT NULL
    )''');

    // Add Dummy Flights
    Flight f1 = Flight(
        flightId: "6E-245",
        name: "Indigo",
        pnr: "IR89XX",
        departure:
            DateTime.parse("2021-12-15 08:20:00").microsecondsSinceEpoch,
        arrival: DateTime.parse("2021-12-15 11:50:00").microsecondsSinceEpoch,
        source: "CCU",
        destination: "IDR",
        seat: "15A",
        fare: 4536,
        notes:
            "Mayank ki shaadi hai. Dhoom machayenge",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: "trip001");

    Flight f2 = Flight(
        flightId: "6E-507",
        name: "Indigo",
        pnr: "KM6GNJ",
        departure:
            DateTime.parse("2021-12-19 19:40:00").microsecondsSinceEpoch,
        arrival: DateTime.parse("2021-12-19 20:55:00").microsecondsSinceEpoch,
        source: "VNS",
        destination: "CCU",
        seat: "6F",
        fare: 4711,
        notes:
            "Home Sweet Home... Home is calling",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: "trip001");

    await createFlight(f1);
    await createFlight(f2);
  }

  Future<Flight> createFlight(Flight flight) async {
    final db = await DbHelper.instance.db;
    final id = await db?.insert(_table, flight.toJSON());
    return flight.copy(id: id);
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

  Future<List<Flight?>?> getFlightsForTrip(String tripId) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result = await db?.query(_table,
        where: "tripId = ?", whereArgs: [tripId], orderBy: "departure ASC");
    return result?.map((flightJSON) => Flight.fromJSON(flightJSON)).toList();
  }
}
