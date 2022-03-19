class Flight {
  final int? id;
  final String flightId;
  final String name;
  final String pnr;
  final int departure;
  final int arrival;
  final String source;
  final String destination;
  final String seat;
  final int fare;
  final String notes;
  final String ticket;
  final String tripId;

  Flight(
      {this.id,
      required this.flightId,
      required this.name,
      required this.pnr,
      required this.departure,
      required this.arrival,
      required this.source,
      required this.destination,
      required this.seat,
      required this.fare,
      required this.notes,
      required this.ticket,
      required this.tripId});

  Flight copy(
          {int? id,
          String? flightId,
          String? name,
          String? pnr,
          int? departure,
          int? arrival,
          String? source,
          String? destination,
          String? seat,
          int? fare,
          String? notes,
          String? ticket,
          String? tripId}) =>
      Flight(
          id: id ?? this.id,
          flightId: flightId ?? this.flightId,
          name: name ?? this.name,
          pnr: pnr ?? this.pnr,
          departure: departure ?? this.departure,
          arrival: arrival ?? this.arrival,
          source: source ?? this.source,
          destination: destination ?? this.destination,
          seat: seat ?? this.seat,
          fare: fare ?? this.fare,
          notes: notes ?? this.notes,
          ticket: ticket ?? this.ticket,
          tripId: tripId ?? this.tripId);

  static Flight fromJSON(Map<String, dynamic> flightJSON) => Flight(
      id: int.parse(flightJSON['id'].toString()),
      flightId: flightJSON['flightId'],
      name: flightJSON['name'],
      pnr: flightJSON['pnr'],
      departure: int.parse(flightJSON['departure'].toString()),
      arrival: int.parse(flightJSON['arrival'].toString()),
      source: flightJSON['source'],
      destination: flightJSON['destination'],
      seat: flightJSON['seat'],
      fare: int.parse(flightJSON['fare'].toString()),
      notes: flightJSON['notes'],
      ticket: flightJSON['ticket'],
      tripId: flightJSON['tripId']);

  toJSON() => {
        "id": id,
        "flightId": flightId,
        "name": name,
        "pnr": pnr,
        "departure": departure,
        "arrival": arrival,
        "source": source,
        "destination": destination,
        "seat": seat,
        "fare": fare,
        "notes": notes,
        "ticket": ticket,
        "tripId": tripId
      };
}
