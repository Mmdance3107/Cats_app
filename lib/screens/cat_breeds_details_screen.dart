import 'package:bloc_cats_app/model/cat_breeds_list.dart';
import 'package:bloc_cats_app/utilities/constants.dart';
import 'package:bloc_cats_app/utilities/custom_functions.dart';
import 'package:flutter/material.dart';

class CatBreedDetailsScreen extends StatelessWidget {
  final CatBreed breed;
  const CatBreedDetailsScreen({Key? key, required this.breed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(
                  breed.image,
                  height: 250,
                  width: 250,
                  fit: BoxFit.fill,
                ),
                spaceBox,
                const Text(
                  'Origin:',
                  style: nameTextStyle,
                ),
                spaceBox,
                Text(
                  breed.origin,
                  style: valueTextStyle,
                ),
                spaceBox,
                const Text('WikiUrl:', style: nameTextStyle),
                spaceBox,
                checkWiki(breed.wikipediaUrl),
                spaceBox,
                const Text(
                  'Description:',
                  style: nameTextStyle,
                ),
                spaceBox,
                Text(
                  breed.description,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                spaceBox,
                const Text(
                  'Temperament:',
                  style: nameTextStyle,
                ),
                spaceBox,
                Text(
                  breed.temperament,
                  style: valueTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
