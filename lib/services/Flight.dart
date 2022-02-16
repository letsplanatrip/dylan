class Flight {
  String flightId;
  String flightName;
  DateTime departure;
  DateTime arrival;
  String source;
  String destination;
  int fare;
  String notes;


  Flight.name(this.flightId, this.flightName, this.departure, this.arrival,
      this.source, this.destination, this.fare, this.notes);

  @override
  String toString() {
    return 'Flight{flightId: $flightId, flightName: $flightName, departure: $departure, arrival: $arrival, source: $source, destination: $destination, fare: $fare, notes: $notes}';
  }
}
