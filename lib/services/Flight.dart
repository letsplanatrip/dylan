class Flight {
  String id;
  String name;
  String pnr;
  DateTime departure;
  DateTime arrival;
  String source;
  String destination;
  String seat;
  int fare;
  String notes;
  String ticket;

  Flight(
      this.id,
      this.name,
      this.pnr,
      this.departure,
      this.arrival,
      this.source,
      this.destination,
      this.seat,
      this.fare,
      this.notes,
      this.ticket);

  @override
  String toString() {
    return 'Flight{id: $id, name: $name, pnr: $pnr, departure: $departure, arrival: $arrival, source: $source, destination: $destination, seat: $seat, fare: $fare, notes: $notes, ticket: $ticket}';
  }
}
