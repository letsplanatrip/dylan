import 'package:dylan/db/db_helper.dart';
import 'package:dylan/models/Flight.dart';

class FlightDbHandler {
  static const String table = "flights";

  Future<void> initFlights() async {
    final db = await DbHelper.instance.db;
    // Drop Flights
    await db?.execute("DROP TABLE IF EXISTS $table");

    // Create Flights
    await db?.execute('''CREATE TABLE $table (
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
        flightId: "6E-751",
        name: "Indigo",
        pnr: "A2H9QZ",
        departure:
            DateTime.parse("2021-12-24 12:35:00Z").microsecondsSinceEpoch,
        arrival: DateTime.parse("2021-12-24 13:45:00Z").microsecondsSinceEpoch,
        source: "CCU",
        destination: "IXB",
        seat: "6F",
        fare: 4536,
        notes:
            "Flights to Bagdogra is a most heavily planned flight in most of the world",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: "trip001");

    Flight f2 = Flight(
        flightId: "AI-747",
        name: "Air India",
        pnr: "A2H9QZ",
        departure:
            DateTime.parse("2021-12-23 12:35:00Z").microsecondsSinceEpoch,
        arrival: DateTime.parse("2021-12-24 13:45:00Z").microsecondsSinceEpoch,
        source: "CCU",
        destination: "IXB",
        seat: "6F",
        fare: 4536,
        notes:
            "Flights to Bagdogra is a most heavily planned flight in most of the world",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: "trip001");

    Flight f3 = Flight(
        flightId: "AI-747",
        name: "Air India",
        pnr: "A2H9QZ",
        departure:
            DateTime.parse("2021-12-25 12:35:00Z").microsecondsSinceEpoch,
        arrival: DateTime.parse("2021-12-24 13:45:00Z").microsecondsSinceEpoch,
        source: "CCU",
        destination: "IXB",
        seat: "6F",
        fare: 4536,
        notes:
            "Flights to Bagdogra is a most heavily planned flight in most of the world",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: "trip001");

    await createFlight(f1);
    await createFlight(f2);
    await createFlight(f3);
  }

  Future<Flight> createFlight(Flight flight) async {
    final db = await DbHelper.instance.db;
    final id = await db?.insert(table, flight.toJSON());
    return flight.copy(id: id);
  }

  Future<Flight?> getFlightById(int id) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result =
        await db?.query(table, where: "id = ?", whereArgs: [id]);
    return result
        ?.map((flightJSON) => Flight.fromJSON(flightJSON))
        .toList()
        .first;
  }

  Future<List<Flight?>?> getFlightsForTrip(String tripId) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result = await db?.query(table,
        where: "tripId = ?", whereArgs: [tripId], orderBy: "departure ASC");
    return result?.map((flightJSON) => Flight.fromJSON(flightJSON)).toList();
  }
}
