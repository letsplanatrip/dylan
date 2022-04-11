import 'package:date_time_picker/date_time_picker.dart';
import 'package:dylan/db/hotel_db_handler.dart';
import 'package:dylan/models/hotel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class HotelForm extends StatefulWidget {
  final Hotel _hotel;

  const HotelForm(this._hotel, {Key? key}) : super(key: key);

  @override
  _HotelFormState createState() => _HotelFormState();
}

class _HotelFormState extends State<HotelForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final hotelNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final emailIdController = TextEditingController();
  final checkInController = TextEditingController();
  final checkOutController = TextEditingController();
  final roomTypeController = TextEditingController();
  final roomNumberController = TextEditingController();
  final fareController = TextEditingController();
  final notesController = TextEditingController();
  final ticketController = TextEditingController();
  late final _hotel;

  @override
  void dispose() {
    hotelNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    phoneController.dispose();
    emailIdController.dispose();
    checkInController.dispose();
    checkOutController.dispose();
    roomTypeController.dispose();
    roomNumberController.dispose();
    fareController.dispose();
    notesController.dispose();
    ticketController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    hotelNameController.text = widget._hotel.name;
    addressController.text = widget._hotel.address;
    cityController.text = widget._hotel.city;
    phoneController.text = widget._hotel.phone;
    emailIdController.text = widget._hotel.emailId;
    checkInController.text =
        DateTime.fromMicrosecondsSinceEpoch(widget._hotel.checkIn).toString();
    checkOutController.text =
        DateTime.fromMicrosecondsSinceEpoch(widget._hotel.checkOut).toString();
    roomTypeController.text = widget._hotel.roomType;
    roomNumberController.text = widget._hotel.roomNumber;
    fareController.text = widget._hotel.fare.toString();
    notesController.text = widget._hotel.notes;
    ticketController.text = widget._hotel.ticket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextButton.icon(
              icon: const Icon(
                Icons.hotel_outlined,
                color: Colors.white,
              ),
              label: const Text(
                "Hotel",
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
                    // Hotel Name Text Field
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Hotel Name",
                        ),
                        controller: hotelNameController,
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
                          labelText: "Address",
                        ),
                        controller: addressController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.location_on, color: Colors.white),
                      ),
                      onPressed: () => {},
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
                        controller: checkInController,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: "Check In",
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
                        controller: checkOutController,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: "Check Out",
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
                          labelText: "Room Type",
                        ),
                        controller: roomTypeController,
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
                          labelText: "Room Number",
                        ),
                        controller: roomNumberController,
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
                        //   _hotel = Hotel(
                        //       id: widget._hotel.id,
                        //       hotelId: hotelIDController.text,
                        //       name: hotelNameController.text,
                        //       pnr: pnrController.text,
                        //       departure:
                        //           DateTime.parse(departureController.text)
                        //               .microsecondsSinceEpoch,
                        //       arrival: DateTime.parse(arrivalController.text)
                        //           .microsecondsSinceEpoch,
                        //       source: sourceController.text,
                        //       destination: destinationController.text,
                        //       seat: seatController.text,
                        //       fare: double.parse(fareController.text),
                        //       notes: notesController.text,
                        //       ticket: ticketController.text,
                        //       tripId: widget._hotel.tripId),
                        //   await HotelDbHandler().updateHotel(_hotel),
                        //   Navigator.pop(context, _hotel),
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
