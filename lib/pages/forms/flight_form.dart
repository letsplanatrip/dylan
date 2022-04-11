import 'package:date_time_picker/date_time_picker.dart';
import 'package:dylan/db/flight_db_handler.dart';
import 'package:dylan/models/flight.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class FlightForm extends StatefulWidget {
  final Flight _flight;

  const FlightForm(this._flight, {Key? key}) : super(key: key);

  @override
  _FlightFormState createState() => _FlightFormState();
}

class _FlightFormState extends State<FlightForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final flightIDController = TextEditingController();
  final flightNameController = TextEditingController();
  final sourceController = TextEditingController();
  final destinationController = TextEditingController();
  final departureController = TextEditingController();
  final arrivalController = TextEditingController();
  final pnrController = TextEditingController();
  final seatController = TextEditingController();
  final fareController = TextEditingController();
  final notesController = TextEditingController();
  final ticketController = TextEditingController();
  late final _flight;

  @override
  void dispose() {
    flightIDController.dispose();
    flightNameController.dispose();
    sourceController.dispose();
    destinationController.dispose();
    departureController.dispose();
    arrivalController.dispose();
    pnrController.dispose();
    seatController.dispose();
    fareController.dispose();
    notesController.dispose();
    ticketController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    flightIDController.text = widget._flight.flightId;
    flightNameController.text = widget._flight.name;
    sourceController.text = widget._flight.source;
    destinationController.text = widget._flight.destination;
    departureController.text = DateTime.fromMicrosecondsSinceEpoch(widget._flight.departure).toString();
    arrivalController.text = DateTime.fromMicrosecondsSinceEpoch(widget._flight.arrival).toString();
    pnrController.text = widget._flight.pnr;
    seatController.text = widget._flight.seat;
    fareController.text = widget._flight.fare.toString();
    notesController.text = widget._flight.notes;
    ticketController.text = widget._flight.ticket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextButton.icon(
              icon: const Icon(
                Icons.flight_takeoff_outlined,
                color: Colors.white,
              ),
              label: const Text(
                "Flight",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () => {})),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Row(
                  children: [
                    // Flight ID Text Field
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Flight ID",
                        ),
                        controller: flightIDController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Flight Name Text Field
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Flight Name",
                        ),
                        controller: flightNameController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    // Source Text Field
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Source",
                        ),
                        controller: sourceController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Destination Text Field
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Destination",
                        ),
                        controller: destinationController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: DateTimePicker(
                        type: DateTimePickerType.dateTime,
                        dateMask: 'EEE - d/M/yy - hh:mm a',
                        controller: departureController,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: "Departure",
                        use24HourFormat: false,
                        locale: const Locale('en', 'US'),
                        onChanged: (val) => {},
                        onSaved: (val) => {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: DateTimePicker(
                        type: DateTimePickerType.dateTime,
                        dateMask: 'EEE - d/M/yy - hh:mm a',
                        controller: arrivalController,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: "Arrival",
                        use24HourFormat: false,
                        locale: const Locale('en', 'US'),
                        onChanged: (val) => {},
                        onSaved: (val) => {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    // PNR Text Field
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "PNR",
                        ),
                        controller: pnrController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Seat Text Field
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Seat",
                        ),
                        controller: seatController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Fare Text Field
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Fare",
                        ),
                        controller: fareController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Notes",
                        ),
                        controller: notesController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Ticket",
                        ),
                        controller: ticketController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.attachment, color: Colors.white),
                      ),
                      onPressed: () => {pickFile()},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () async => {
                          _flight = Flight(
                              id: widget._flight.id,
                              flightId: flightIDController.text,
                              name: flightNameController.text,
                              pnr: pnrController.text,
                              departure: DateTime.parse(departureController.text).microsecondsSinceEpoch,
                              arrival: DateTime.parse(arrivalController.text).microsecondsSinceEpoch,
                              source: sourceController.text,
                              destination: destinationController.text,
                              seat: seatController.text,
                              fare: double.parse(fareController.text),
                              notes: notesController.text,
                              ticket: ticketController.text,
                              tripId: widget._flight.tripId),
                      await FlightDbHandler().updateFlight(_flight),
                      Navigator.pop(context, _flight),
                        },
                    child: const Text("Update")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    ticketController.text = result.files.first.path!;
  }
}
