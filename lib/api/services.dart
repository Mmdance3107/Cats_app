import 'package:bloc_cats_app/model/cat_breeds_list.dart';
import 'package:dio/dio.dart';

abstract class CatBreedsRepo {
  Future<List<CatBreed>> getCatBreedsList();
}

class CatBreedsServices implements CatBreedsRepo {
  static const basicUrl = 'https://api.thecatapi.com/v1';
  static const breedsUrl = '$basicUrl/breeds';

  @override
  Future<List<CatBreed>> getCatBreedsList() async {
    Response<String> response = await Dio().get(breedsUrl);
    String body = response.data.toString();
    List<CatBreed> breeds = catBreedFromJson(body);
    return breeds;
  }
}
