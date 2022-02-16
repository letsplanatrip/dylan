class Flight {
  String id;
  String name;
  DateTime departure;
  DateTime arrival;
  String source;
  String destination;
  String seat;
  int fare;
  String notes;

  Flight.builder(this.id, this.name, this.departure, this.arrival, this.source,
      this.destination, this.seat, this.fare, this.notes);

  @override
  String toString() {
    return 'Flight{id: $id, name: $name, departure: $departure, arrival: $arrival, source: $source, destination: $destination, seat: $seat, fare: $fare, notes: $notes}';
  }
}
