import 'package:dylan/models/Train.dart';
import 'package:dylan/models/Flight.dart';
import 'package:dylan/widgets/date_card.dart';
import 'package:dylan/widgets/flight_card.dart';
import 'package:dylan/widgets/train_card.dart';
import 'package:flutter/material.dart';

class Iteranary extends StatefulWidget {
  final List<Flight?>? _flights;
  final List<Train?>? _trains;

  const Iteranary(this._flights, this._trains, {Key? key}) : super(key: key);

  @override
  _IteranaryState createState() => _IteranaryState();
}

class _IteranaryState extends State<Iteranary> {
  late List _iteranary;

  @override
  Widget build(BuildContext context) {
    _iteranary = sortIteranary(widget._flights, widget._trains);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: TextButton.icon(
              icon: const Icon(
                Icons.list,
                color: Colors.white,
              ),
              label: const Text(
                "Iteranary",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () => {})),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IteranaryDateCard(date:DateTime.parse("2021-12-16 00:00:00").microsecondsSinceEpoch),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _iteranary.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 1.5, 0.0, 1.5),
                    child: card(_iteranary[index]),
                  );
                }),
            IteranaryDateCard(date:DateTime.parse("2021-12-17 00:00:00").microsecondsSinceEpoch),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _iteranary.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 1.5, 0.0, 1.5),
                    child: card(_iteranary[index]),
                  );
                }),
          ],
        ),
      ),
    );
  }

  sortIteranary(List<Flight?>? flights, List<Train?>? trains) {
    List iteranary = [...?flights, ...?trains];
    iteranary.sort((a, b) => a.departure.compareTo(b.departure));
    return iteranary;
  }

  Container? card(Object obj) {
    if (obj is Flight) {
      return Container(
        child: IteranaryFlightCard(flight: obj as Flight),
      );
    } else if (obj is Train) {
      return Container(
        child: IteranaryTrainCard(train: obj as Train),
      );
    }
  }
}
