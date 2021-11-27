// event, state => new sate => update UI

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bloc_cats_app/api/exceptions.dart';
import 'package:bloc_cats_app/api/services.dart';
import 'package:bloc_cats_app/bloc/cat_breeds/events.dart';
import 'package:bloc_cats_app/bloc/cat_breeds/states.dart';
import 'package:bloc_cats_app/model/cat_breeds_list.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvents, CatBreedsState> {
  final CatBreedsRepo catBreedsRepo;
  List<CatBreed> breeds = [];

  CatBreedsBloc({required this.catBreedsRepo}) : super(CatBreedsInitState()) {
    on<FetchCatBreedsEvent>(_onFetchCatBreedsEvent);
  }

  void _onFetchCatBreedsEvent(
      FetchCatBreedsEvent event, Emitter<CatBreedsState> emit) async {
    emit(CatBreedsLoading());
    try {
      breeds = await catBreedsRepo.getCatBreedsList();
      emit(CatBreedsLoaded(breeds: breeds));
    } on SocketException {
      emit(CatBreedsListError(error: NoInternetException('No Internet')));
    } on HttpException {
      emit(CatBreedsListError(
          error: NoServiceFoundException('Service Exception')));
    } on FormatException {
      emit(CatBreedsListError(error: InvalidFormatException('Invalid Format')));
    } catch (e) {
      emit(CatBreedsListError(error: UnknownException('Unknown Error')));
    }
  }
}
