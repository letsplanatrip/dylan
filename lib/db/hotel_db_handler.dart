import 'package:dylan/db/db_helper.dart';
import 'package:dylan/models/hotel.dart';

class HotelDbHandler {
  static const String _table = "hotels";

  Future<void> initHotels() async {
    final db = await DbHelper.instance.db;
    // Drop Hotels
    await db?.execute("DROP TABLE IF EXISTS $_table");

    // Create Hotels
    await db?.execute('''CREATE TABLE $_table (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    eventTs INTEGER NOT NULL,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    city TEXT NOT NULL,
    phone TEXT NOT NULL,
    emailId TEXT NOT NULL,
    checkIn INTEGER NOT NULL,
    checkOut INTEGER NOT NULL,
    roomType TEXT NOT NULL,
    roomNumber TEXT NOT NULL,
    fare NUMERIC NOT NULL,
    notes TEXT NOT NULL,
    ticket TEXT NOT NULL,
    tripId INTEGER NOT NULL
    )''');

    // Add Dummy Hotels 
    Hotel h1 = Hotel(
        name: "Dwivedi Hotels Palace On Steps",
        address:
            "Rana Mahal Ghat, D21 / 11, Bangali Tola Rd, near Dashaswamedh Ghat, Bangali Tola, Varanasi, Uttar Pradesh 221001",
        city: "Varanasi",
        phone: "9140185471",
        emailId: "",
        checkIn: DateTime.parse("2021-12-18 12:00:00").microsecondsSinceEpoch,
        checkOut: DateTime.parse("2021-12-19 11:00:00").microsecondsSinceEpoch,
        roomType: "Kashi Suites",
        roomNumber: "A-306",
        fare: 5049,
        notes: "One of the best view Hotels in varanasi",
        ticket:
            "/data/user/0/com.letsplanatrip.dylan/cache/file_picker/boarding_pass.pdf",
        tripId: 1);

    await createHotel(h1);
  }

  Future<Hotel> createHotel(Hotel hotel) async {
    final db = await DbHelper.instance.db;
    final id = await db?.insert(_table, hotel.toJSON());
    return hotel.copy(id: id);
  }

  Future<Hotel> updateHotel(Hotel hotel) async {
    final db = await DbHelper.instance.db;
    await db?.update(_table, hotel.toJSON(),
        where: "id = ?", whereArgs: [hotel.id]);
    return hotel;
  }

  Future<Hotel?> getHotelById(int id) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result =
        await db?.query(_table, where: "id = ?", whereArgs: [id]);
    return result?.map((hotelJSON) => Hotel.fromJSON(hotelJSON)).toList().first;
  }

  Future<List<Hotel?>?> getHotelsForTrip(int tripId) async {
    final db = await DbHelper.instance.db;
    List<Map<String, Object?>>? result = await db?.query(_table,
        where: "tripId = ?", whereArgs: [tripId], orderBy: "eventTs ASC");
    return result?.map((hotelJSON) => Hotel.fromJSON(hotelJSON)).toList();
  }

  Future<List<Hotel?>?> getHotelsForTripAndDate(int tripId, int ts) async {
    final db = await DbHelper.instance.db;
    int startTs = ts;
    int endTs = ts + 86400000000 - 1;
    List<Map<String, Object?>>? result = await db?.query(_table,
        where: "tripId = ? AND eventTs >= ? AND eventTs <= ?",
        whereArgs: [tripId, startTs, endTs],
        orderBy: "eventTs ASC");
    return result?.map((hotelJSON) => Hotel.fromJSON(hotelJSON)).toList();
  }
}
