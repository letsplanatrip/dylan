class Trip {
  final int? id;
  int? eventTs;
  final String name;
  final String description;
  final int startDate;
  final int endDate;
  final String notes;

  Trip(
      {this.id,
      this.eventTs,
      required this.name,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.notes}) {
    eventTs = startDate;
  }

  Trip copy(
          {int? id,
          int? eventTs,
          String? name,
          String? description,
          int? startDate,
          int? endDate,
          String? notes}) =>
      Trip(
          id: id ?? this.id,
          eventTs: eventTs ?? this.eventTs,
          name: name ?? this.name,
          description: description ?? this.description,
          startDate: startDate ?? this.startDate,
          endDate: endDate ?? this.endDate,
          notes: notes ?? this.notes);

  static Trip fromJSON(Map<String, dynamic> json) => Trip(
      id: int.parse(json['id'].toString()),
      eventTs: int.parse(json['eventTs'].toString()),
      name: json['name'],
      description: json['description'],
      startDate: int.parse(json['startDate'].toString()),
      endDate: int.parse(json['endDate'].toString()),
      notes: json['notes']);

  toJSON() => {
        "id": id,
        "eventTs": eventTs,
        "name": name,
        "description": description,
        "startDate": startDate,
        "endDate": endDate,
        "notes": notes,
      };
}
