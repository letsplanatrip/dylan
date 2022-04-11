import 'package:dylan/db/db_helper.dart';
import 'package:dylan/models/Trip.dart';

class TripDbHandler {
  static const String _table = "trips";

  Future<void> initTrips() async {
    final db = await DbHelper.instance.db;
    // Drop Trips
    await db?.execute("DROP TABLE IF EXISTS $_table");

    // Create Trips
    await db?.execute('''CREATE TABLE $_table (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    eventTs INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    startDate INTEGER NOT NULL,
    endDate INTEGER NOT NULL,
    notes TEXT NOT NULL
    )''');

    // Add Dummy Flights
    Trip t1 = Trip(
        name: "Mayank ki Shaadi",
        description: "Mere yar ki shaadi hai",
        startDate: DateTime.parse("2021-12-15 00:00:00").microsecondsSinceEpoch,
        endDate: DateTime.parse("2021-12-19 23:59:00").microsecondsSinceEpoch,
        notes: "Indore me shaadi hai");

    await createTrip(t1);
  }

  Future<Trip> createTrip(Trip trip) async {
    final db = await DbHelper.instance.db;
    final id = await db?.insert(_table, trip.toJSON());
    return trip.copy(id: id);
  }

  Future<Trip> updateTrip(Trip trip) async {
    final db = await DbHelper.instance.db;
    await db?.update(_table, trip.toJSON(),
        where: "id = ?", whereArgs: [trip.id]);
    return trip;
  }

  Future<Trip?> getTripById(int id) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result =
        await db?.query(_table, where: "id = ?", whereArgs: [id]);
    return result?.map((json) => Trip.fromJSON(json)).toList().first;
  }
}
