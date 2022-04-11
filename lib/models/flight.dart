class Flight {
  final int? id;
  int? eventTs;
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
  final int tripId;

  Flight(
      {this.id,
      this.eventTs,
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
      required this.tripId}) {
    eventTs = departure;
  }

  Flight copy(
          {int? id,
          int? eventTs,
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
          int? tripId}) =>
      Flight(
          id: id ?? this.id,
          eventTs: eventTs ?? this.eventTs,
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

  static Flight fromJSON(Map<String, dynamic> json) => Flight(
      id: int.parse(json['id'].toString()),
      eventTs: int.parse(json['eventTs'].toString()),
      flightId: json['flightId'],
      name: json['name'],
      pnr: json['pnr'],
      departure: int.parse(json['departure'].toString()),
      arrival: int.parse(json['arrival'].toString()),
      source: json['source'],
      destination: json['destination'],
      seat: json['seat'],
      fare: int.parse(json['fare'].toString()),
      notes: json['notes'],
      ticket: json['ticket'],
      tripId: int.parse(json['tripId'].toString()));

  toJSON() => {
        "id": id,
        "eventTs": eventTs,
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
