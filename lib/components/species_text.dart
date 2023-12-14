import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/utils/constants.dart';

class SpeciesText extends StatelessWidget {
  final Species species;

  const SpeciesText({
    super.key,
    required this.species,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        species == Species.HUMAN
            ? 'HUMAN'
            : species == Species.ALIEN
                ? 'ALIEN'
                : 'UNKNOWN',
        style: kCharacterStatusTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
