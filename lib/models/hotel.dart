class Hotel {
  final int? id;
  int? eventTs;
  final String name;
  final String address;
  final String city;
  final String phone;
  final String emailId;
  final int checkIn;
  final int checkOut;
  final String roomType;
  final String roomNumber;
  final double fare;
  final String notes;
  final String ticket;
  final int tripId;

  Hotel(
      {this.id,
      this.eventTs,
      required this.name,
      required this.address,
      required this.city,
      required this.phone,
      required this.emailId,
      required this.checkIn,
      required this.checkOut,
      required this.roomType,
      required this.roomNumber,
      required this.fare,
      required this.notes,
      required this.ticket,
      required this.tripId}) {
    eventTs = checkIn;
  }

  Hotel copy(
          {int? id,
          int? eventTs,
          String? name,
          String? address,
          String? city,
          String? phone,
          String? emailId,
          int? checkIn,
          int? checkOut,
          String? roomType,
          String? roomNumber,
          double? fare,
          String? notes,
          String? ticket,
          int? tripId}) =>
      Hotel(
        id: id ?? this.id,
        eventTs: eventTs ?? this.eventTs,
        name: name ?? this.name,
        address: address ?? this.address,
        city: city ?? this.city,
        phone: phone ?? this.phone,
        emailId: emailId ?? this.emailId,
        checkIn: checkIn ?? this.checkIn,
        checkOut: checkOut ?? this.checkOut,
        roomType: roomType ?? this.roomType,
        roomNumber: roomNumber ?? this.roomNumber,
        fare: fare ?? this.fare,
        notes: notes ?? this.notes,
        ticket: ticket ?? this.ticket,
        tripId: tripId ?? this.tripId,
      );

  static Hotel fromJSON(Map<String, dynamic> json) => Hotel(
        id: int.parse(json['id'].toString()),
        eventTs: int.parse(json['eventTs'].toString()),
        name: json['name'],
        address: json['address'],
        city: json['city'],
        phone: json['phone'],
        emailId: json['emailId'],
        checkIn: int.parse(json['checkIn'].toString()),
        checkOut: int.parse(json['checkOut'].toString()),
        roomType: json['roomType'],
        roomNumber: json['roomNumber'],
        fare: double.parse(json['fare'].toString()),
        notes: json['notes'],
        ticket: json['ticket'],
        tripId: int.parse(json['tripId'].toString()),
      );

  toJSON() => {
        "id": id,
        "eventTs": eventTs,
        "name": name,
        "address": address,
        "city": city,
        "phone": phone,
        "emailId": emailId,
        "checkIn": checkIn,
        "checkOut": checkOut,
        "roomType": roomType,
        "roomNumber": roomNumber,
        "fare": fare,
        "notes": notes,
        "ticket": ticket,
        "tripId": tripId,
      };
}
