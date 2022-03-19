class Train {
  final int? id;
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
  final int fare;
  final String notes;
  final String ticket;
  final String tripId;

  Train({this.id,
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
        required this.tripId});

  Train copy({int? id,
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
        int? fare,
        String? notes,
        String? ticket,
        String? tripId}) =>
      Train(
          id: id ?? this.id,
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
      fare: int.parse(json['fare'].toString()),
      notes: json['notes'],
      ticket: json['ticket'],
      tripId: json['tripId']);

  toJSON() => {
    "id": id,
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