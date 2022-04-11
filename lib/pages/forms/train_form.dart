import 'package:date_time_picker/date_time_picker.dart';
import 'package:dylan/db/train_db_handler.dart';
import 'package:dylan/models/flight.dart';
import 'package:dylan/models/train.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class TrainForm extends StatefulWidget {
  final Train _train;

  const TrainForm(this._train, {Key? key}) : super(key: key);

  @override
  _TrainFormState createState() => _TrainFormState();
}

class _TrainFormState extends State<TrainForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final trainIdController = TextEditingController();
  final nameController = TextEditingController();
  final sourceController = TextEditingController();
  final destinationController = TextEditingController();
  final departureController = TextEditingController();
  final arrivalController = TextEditingController();
  final pnrController = TextEditingController();
  final statusController = TextEditingController();
  final compartmentController = TextEditingController();
  final seatController = TextEditingController();
  final berthController = TextEditingController();
  final fareController = TextEditingController();
  final notesController = TextEditingController();
  final ticketController = TextEditingController();
  late Train _train;

  @override
  void dispose() {
    trainIdController.dispose();
    nameController.dispose();
    sourceController.dispose();
    destinationController.dispose();
    departureController.dispose();
    arrivalController.dispose();
    pnrController.dispose();
    statusController.dispose();
    compartmentController.dispose();
    seatController.dispose();
    berthController.dispose();
    fareController.dispose();
    notesController.dispose();
    ticketController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    trainIdController.text = widget._train.trainId;
    nameController.text = widget._train.name;
    sourceController.text = widget._train.source;
    destinationController.text = widget._train.destination;
    departureController.text =
        DateTime.fromMicrosecondsSinceEpoch(widget._train.departure).toString();
    arrivalController.text =
        DateTime.fromMicrosecondsSinceEpoch(widget._train.arrival).toString();
    pnrController.text = widget._train.pnr;
    statusController.text = widget._train.status;
    compartmentController.text = widget._train.compartment;
    seatController.text = widget._train.seat;
    berthController.text = widget._train.berth;
    fareController.text = widget._train.fare.toString();
    notesController.text = widget._train.notes;
    ticketController.text = widget._train.ticket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextButton.icon(
              icon: const Icon(
                Icons.train_outlined,
                color: Colors.white,
              ),
              label: const Text(
                "Train",
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
                          labelText: "Train ID",
                        ),
                        controller: trainIdController,
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
                          labelText: "Train Name",
                        ),
                        controller: nameController,
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
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Status",
                        ),
                        controller: statusController,
                      ),
                    ),
                    // Seat Text Field
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
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Compartment",
                        ),
                        controller: compartmentController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
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
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Berth",
                        ),
                        controller: berthController,
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
                          _train = Train(
                              id: widget._train.id,
                              trainId: trainIdController.text,
                              name: nameController.text,
                              pnr: pnrController.text,
                              departure: DateTime.parse(departureController.text).microsecondsSinceEpoch,
                              arrival: DateTime.parse(arrivalController.text).microsecondsSinceEpoch,
                              source: sourceController.text,
                              destination: destinationController.text,
                              compartment: compartmentController.text,
                              seat: seatController.text,
                              berth: berthController.text,
                              status: statusController.text,
                              fare: double.parse(fareController.text),
                              notes: notesController.text,
                              ticket: ticketController.text,
                              tripId: widget._train.tripId),
                      await TrainDbHandler().updateTrain(_train),
                      Navigator.pop(context, _train),
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
