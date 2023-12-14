import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/components/status_row.dart';
import 'package:rick_and_morty_app/components/table_row.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/screens/character_screen/character_view_model.dart';
import 'package:rick_and_morty_app/utils/constants.dart';

class CharacterDetails extends StatelessWidget {
  final Result result;

  const CharacterDetails({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final characterVM = Provider.of<CharacterViewModel>(context);

    return FutureBuilder<List<Result>>(
      future: characterVM.getCharacters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No books available.'),
          );
        } else {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: AppBar(
              backgroundColor: kBackgroundColorAppBar,
              title: Text(
                result.name,
                style: kAppBarTextStyle,
              ),
              foregroundColor: Colors.grey.shade400,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: kCardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(result.image),
                            radius: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            result.name,
                            style: kCharacterTitleTextStyle,
                          ),
                          StatusRow(
                            status: result.status,
                            species: result.species,
                          ),
                          TableRowDetails(
                            title: 'Gender:',
                            value: result.gender
                                .toString()
                                .replaceAll('Gender.', ''),
                          ),
                          TableRowDetails(
                            title: 'Origin:',
                            value: result.origin.name,
                          ),
                          TableRowDetails(
                            title: 'Last Location:',
                            value: result.location.name,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
