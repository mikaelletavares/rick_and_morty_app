import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/utils/constants.dart';

class TableRowDetails extends StatelessWidget {
  final String title, value;

  const TableRowDetails({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(4),
            child: Text(
              addNewLineCharacter(value),
              style: kCharacterTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Text(
              value,
              style: kCharacterStatusTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  String addNewLineCharacter(String result) {
    if (result.length <= 23 && result.allMatches(' ').length <= 2) {
      return title;
    } else {
      return '$title\n';
    }
  }
}
