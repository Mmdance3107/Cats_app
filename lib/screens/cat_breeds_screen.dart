import 'package:bloc_cats_app/bloc/bloc.dart';
import 'package:bloc_cats_app/bloc/events.dart';
import 'package:bloc_cats_app/bloc/states.dart';
import 'package:bloc_cats_app/model/cat_breeds_list.dart';
import 'package:bloc_cats_app/screens/cat_breeds_details_screen.dart';
import 'package:bloc_cats_app/utilities/constants.dart';
import 'package:bloc_cats_app/utilities/custom_functions.dart';
import 'package:bloc_cats_app/widgets/error_widget.dart';
import 'package:bloc_cats_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedsScreen extends StatefulWidget {
  const CatBreedsScreen({Key? key}) : super(key: key);

  @override
  _CatBreedsScreenState createState() => _CatBreedsScreenState();
}

class _CatBreedsScreenState extends State<CatBreedsScreen> {
  @override
  void initState() {
    super.initState();
    _loadCatBreeds();
  }

  _loadCatBreeds() async {
    context
        .read<CatBreedsBloc>()
        .add(FetchCatBreedsEvent()); //CatBreedsEvents.fetchCatBreeds
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breeds'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        BlocBuilder<CatBreedsBloc, CatBreedsState>(
          builder: (BuildContext context, CatBreedsState state) {
            if (state is CatBreedsListError) {
              final error = state.error;
              return ErrWidget(
                message: error.message,
              );
            } else if (state is CatBreedsLoaded) {
              List<CatBreed> breeds = state.breeds;
              return _list(breeds);
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ],
    );
  }

  Widget _list(List<CatBreed> breeds) {
    return Expanded(
      child: ListView.builder(
          itemCount: breeds.length,
          itemBuilder: (_, index) {
            CatBreed breed = breeds[index];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                borderRadius: radius,
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return CatBreedDetailsScreen(breed: breed);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.network(
                          breed.image,
                          width: 120,
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(breed.name, style: nameTextStyle),
                              spaceBox,
                              Row(
                                children: [
                                  const Text(
                                    'Original: ',
                                    style: nameTextStyle,
                                  ),
                                  Expanded(
                                    child: Text(
                                      breed.origin,
                                      style: valueTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              spaceBox,
                              checkWiki(breed.wikipediaUrl),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
