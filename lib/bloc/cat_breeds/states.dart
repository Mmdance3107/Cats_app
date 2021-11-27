// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc_cats_app/model/cat_breeds_list.dart';
import 'package:equatable/equatable.dart';

abstract class CatBreedsState extends Equatable {
  @override
  List<Object> get props => [];
}

class CatBreedsInitState extends CatBreedsState {}

class CatBreedsLoading extends CatBreedsState {}

class CatBreedsLoaded extends CatBreedsState {
  final List<CatBreed> breeds;
  CatBreedsLoaded({required this.breeds});
}

class CatBreedsListError extends CatBreedsState {
  final error;
  CatBreedsListError({required this.error});
}
