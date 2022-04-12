import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CollapsableDateCard extends StatefulWidget {
  final int? date;
  final ListView? iteranaryList;
  final Function()? notifyParent;

  const CollapsableDateCard(
      {Key? key, this.date, this.iteranaryList, this.notifyParent})
      : super(key: key);

  @override
  State<CollapsableDateCard> createState() => _CollapsableDateCardState();
}

class _CollapsableDateCardState extends State<CollapsableDateCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: Colors.black26,
      expandedColor: Colors.black45,
      initiallyExpanded: true,
      borderRadius: const BorderRadius.all(Radius.zero),
      finalPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: Align(
        child: Text(
          DateFormat.yMMMMEEEEd()
              .format(DateTime.fromMicrosecondsSinceEpoch(widget.date!)),
          style: GoogleFonts.quicksand(
              textStyle: const TextStyle(color: Colors.white),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      trailing: const SizedBox(width:0),
      children: <Widget>[
        const Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        widget.iteranaryList!
      ],
    );
  }
}
