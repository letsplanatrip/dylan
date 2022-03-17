import 'dart:collection';

import 'package:dylan/services/Flight.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class FlightEventForm extends StatefulWidget {
  final Flight _flight;

  const FlightEventForm(this._flight, {Key? key}) : super(key: key);

  @override
  _FlightEventFormState createState() => _FlightEventFormState();
}

class _FlightEventFormState extends State<FlightEventForm> {
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
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    flightIDController.text = widget._flight.id;
    flightNameController.text = widget._flight.name;
    sourceController.text = widget._flight.source;
    destinationController.text = widget._flight.destination;
    departureController.text = widget._flight.departure.toString();
    arrivalController.text = widget._flight.arrival.toString();
    pnrController.text = widget._flight.pnr;
    seatController.text = widget._flight.seat;
    fareController.text = widget._flight.fare.toString();
    notesController.text = widget._flight.notes;
  }

  Widget _dateTime(String label, DateTime value) {
    return Flexible(
      child: DateTimePicker(
        type: DateTimePickerType.dateTime,
        dateMask: 'd/M/yy - hh:mm a',
        controller: TextEditingController(text: value.toString()),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        //icon: Icon(Icons.event),
        dateLabelText: label,
        use24HourFormat: false,
        locale: const Locale('en', 'US'),
        onChanged: (val) => {},
        onSaved: (val) => {print(val)},
      ),
    );
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
                      dateMask: 'd/M/yy - hh:mm a',
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
                      dateMask: 'd/M/yy - hh:mm a',
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
                height: 40,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () => {
                        _flight = Flight(
                            flightIDController.text,
                            flightNameController.text,
                            pnrController.text,
                            DateTime.parse(departureController.text),
                            DateTime.parse(arrivalController.text),
                            sourceController.text,
                            destinationController.text,
                            seatController.text,
                            int.parse(fareController.text),
                            notesController.text,
                            "assets/pdf/boarding_pass.pdf"),
                        print(_flight)
                      },
                  child: const Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
