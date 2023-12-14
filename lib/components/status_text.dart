import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/utils/constants.dart';

class StatusText extends StatelessWidget {
  final Status status;

  const StatusText({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      status == Status.ALIVE
          ? 'ALIVE'
          : status == Status.DEAD
              ? 'DEAD'
              : '',
      style: kCharacterStatusTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
