import 'package:dylan/db/db_helper.dart';
import 'package:dylan/models/train.dart';

class TrainDbHandler {
  static const String _table = "trains";

  Future<void> initTrains() async {
    final db = await DbHelper.instance.db;
    // Drop Flights
    await db?.execute("DROP TABLE IF EXISTS $_table");

    // Create Flights
    await db?.execute('''CREATE TABLE $_table (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    eventTs INTEGER NOT NULL,
    trainId TEXT NOT NULL,
    name TEXT NOT NULL,
    pnr TEXT NOT NULL,
    departure INTEGER NOT NULL,
    arrival INTEGER NOT NULL,
    source TEXT NOT NULL,
    destination TEXT NOT NULL,
    compartment TEXT NOT NULL,
    seat TEXT NOT NULL,
    berth TEXT NOT NULL,
    status TEXT NOT NULL,
    fare INTEGER NOT NULL,
    notes TEXT NOT NULL,
    ticket TEXT NOT NULL,
    tripId INTEGER NOT NULL
    )''');

    // Add Dummy Flights
    Train t1 = Train(
        trainId: "02291",
        name: "INDB JBP SPL",
        pnr: "8343367217",
        departure: DateTime.parse("2021-12-16 19:30:00").microsecondsSinceEpoch,
        arrival: DateTime.parse("2021-12-17 05:40:00").microsecondsSinceEpoch,
        source: "INDB",
        destination: "JBP",
        compartment: "B1",
        seat: "33",
        berth: "LB",
        status: "CNF",
        fare: 970,
        notes: "Train from Indore to Jabalpur",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: 1);

    Train t2 = Train(
        trainId: "02165",
        name: "LTT GKP FEST SPL",
        pnr: "8343367318",
        departure: DateTime.parse("2021-12-17 21:50:00").microsecondsSinceEpoch,
        arrival: DateTime.parse("2021-12-18 07:10:00").microsecondsSinceEpoch,
        source: "JBP",
        destination: "BSB",
        compartment: "B2",
        seat: "25",
        berth: "LB",
        status: "CNF",
        fare: 1130,
        notes: "Train from Jabalpur to Banaras",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: 1);

    await createTrain(t1);
    await createTrain(t2);
  }

  Future<Train> createTrain(Train train) async {
    final db = await DbHelper.instance.db;
    final id = await db?.insert(_table, train.toJSON());
    return train.copy(id: id);
  }

  Future<Train> updateTrain(Train train) async {
    final db = await DbHelper.instance.db;
    await db?.update(_table, train.toJSON(),
        where: "id = ?", whereArgs: [train.id]);
    return train;
  }

  Future<Train?> getTrainById(int id) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result =
        await db?.query(_table, where: "id = ?", whereArgs: [id]);
    return result?.map((json) => Train.fromJSON(json)).toList().first;
  }

  Future<List<Train?>?> getTrainsForTrip(int tripId) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result = await db?.query(_table,
        where: "tripId = ?", whereArgs: [tripId], orderBy: "departure ASC");
    return result?.map((json) => Train.fromJSON(json)).toList();
  }

  Future<List<Train?>?> getTrainsForTripAndDate(int tripId, int ts) async {
    final db = await DbHelper.instance.db;
    int startTs = ts;
    int endTs = ts + 86400000000 - 1;
    List<Map<String, Object?>>? result = await db?.query(_table,
        where: "tripId = ? AND eventTs >= ? AND eventTs <= ?",
        whereArgs: [tripId, startTs, endTs],
        orderBy: "eventTs ASC");
    return result?.map((json) => Train.fromJSON(json)).toList();
  }
}
