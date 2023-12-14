import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/screens/character_screen/character_details.dart';
import 'package:rick_and_morty_app/screens/character_screen/character_view_model.dart';
import 'package:rick_and_morty_app/utils/constants.dart';

class CharacterScreen extends StatelessWidget {
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
                title: const Text('Characters', style: kAppBarTextStyle),
              ),
              body: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var result = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterDetails(
                              result: result,
                            ),
                          ));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(result.image),
                                radius: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                result.name,
                                style: kListTextStyle,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: kDividerColor,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
