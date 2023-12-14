import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/components/circle_status.dart';
import 'package:rick_and_morty_app/components/species_text.dart';
import 'package:rick_and_morty_app/components/status_text.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/utils/constants.dart';

class StatusRow extends StatelessWidget {
  final Status status;
  final Species species;

  const StatusRow({
    super.key,
    required this.status,
    required this.species,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        width: 400.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(100.0),
          ),
          color: kTableRowColor,
        ),
        margin: const EdgeInsets.only(top: 0, bottom: 20),
        child: Row(
          children: <Widget>[
            StatusText(status: status),
            const SizedBox(width: 7),
            StatusCircle(status: status),
            const SizedBox(width: 15),
            const Text('|', style: kCharacterStatusTextStyle),
            SpeciesText(species: species),
          ],
        ),
      ),
    );
  }
}
