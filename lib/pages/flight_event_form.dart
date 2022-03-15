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

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  Widget _textBox(String label) {
    return Flexible(
      child: TextField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: label,
        ),
        controller: TextEditingController(text: "Aurobindo"),
      ),
    );
  }

  Widget _dateTime(String label) {
    return Flexible(
      child: DateTimePicker(
        type: DateTimePickerType.dateTime,
        dateMask: 'd/M/yy - hh:mm a',
        // controller: TextEditingController(text: DateTime.now().toString()),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        //icon: Icon(Icons.event),
        dateLabelText: label,
        use24HourFormat: false,
        locale: const Locale('en', 'US'),
        onChanged: (val) => {},
        onSaved: (val) => {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flight"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: Form(
          child: Column(
            children: [
              Row(
                children: [
                  _textBox("FlightID"),
                  const SizedBox(
                    width: 10,
                  ),
                  _textBox("FlightName"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  _textBox("Source"),
                  const SizedBox(
                    width: 10,
                  ),
                  _textBox("Destination"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  _dateTime("Departure"),
                  const SizedBox(
                    width: 10,
                  ),
                  _dateTime("Arrival"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  _textBox("PNR"),
                  const SizedBox(
                    width: 10,
                  ),
                  _textBox("Seat"),
                  const SizedBox(
                    width: 10,
                  ),
                  _textBox("Fare"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  _textBox("Notes"),
                ],
              ),
              ElevatedButton(onPressed: () => {}, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
