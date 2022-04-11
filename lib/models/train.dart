class Train {
  final int? id;
  int? eventTs;
  final String trainId;
  final String name;
  final String pnr;
  final int departure;
  final int arrival;
  final String source;
  final String destination;
  final String compartment;
  final String seat;
  final String berth;
  final String status;
  final double fare;
  final String notes;
  final String ticket;
  final int tripId;

  Train(
      {this.id,
      this.eventTs,
      required this.trainId,
      required this.name,
      required this.pnr,
      required this.departure,
      required this.arrival,
      required this.source,
      required this.destination,
      required this.compartment,
      required this.seat,
      required this.berth,
      required this.status,
      required this.fare,
      required this.notes,
      required this.ticket,
      required this.tripId}) {
    eventTs = departure;
  }

  Train copy(
          {int? id,
          int? eventTs,
          String? trainId,
          String? name,
          String? pnr,
          int? departure,
          int? arrival,
          String? source,
          String? destination,
          String? compartment,
          String? seat,
          String? berth,
          String? status,
          double? fare,
          String? notes,
          String? ticket,
          int? tripId}) =>
      Train(
          id: id ?? this.id,
          eventTs: eventTs ?? this.eventTs,
          trainId: trainId ?? this.trainId,
          name: name ?? this.name,
          pnr: pnr ?? this.pnr,
          departure: departure ?? this.departure,
          arrival: arrival ?? this.arrival,
          source: source ?? this.source,
          destination: destination ?? this.destination,
          compartment: compartment ?? this.compartment,
          seat: seat ?? this.seat,
          berth: berth ?? this.berth,
          status: status ?? this.status,
          fare: fare ?? this.fare,
          notes: notes ?? this.notes,
          ticket: ticket ?? this.ticket,
          tripId: tripId ?? this.tripId);

  static Train fromJSON(Map<String, dynamic> json) => Train(
      id: int.parse(json['id'].toString()),
      eventTs: int.parse(json['eventTs'].toString()),
      trainId: json['trainId'],
      name: json['name'],
      pnr: json['pnr'],
      departure: int.parse(json['departure'].toString()),
      arrival: int.parse(json['arrival'].toString()),
      source: json['source'],
      destination: json['destination'],
      compartment: json['compartment'],
      seat: json['seat'],
      berth: json['berth'],
      status: json['status'],
      fare: double.parse(json['fare'].toString()),
      notes: json['notes'],
      ticket: json['ticket'],
      tripId: int.parse(json['tripId'].toString()));

  toJSON() => {
        "id": id,
        "eventTs": eventTs,
        "trainId": trainId,
        "name": name,
        "pnr": pnr,
        "departure": departure,
        "arrival": arrival,
        "source": source,
        "destination": destination,
        "compartment": compartment,
        "seat": seat,
        "berth": berth,
        "status": status,
        "fare": fare,
        "notes": notes,
        "ticket": ticket,
        "tripId": tripId
      };
}
