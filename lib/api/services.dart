import 'package:bloc_cats_app/model/cat_breeds_list.dart';
import 'package:dio/dio.dart';

abstract class CatBreedsRepo {
  Future<List<CatBreed>> getCatBreedsList();
}

class CatBreedsServices implements CatBreedsRepo {
  static const apiUrl = 'https://api.thecatapi.com/v1/breeds';

  @override
  Future<List<CatBreed>> getCatBreedsList() async {
    Response<String> response = await Dio().get(apiUrl);
    String body = response.data.toString();
    List<CatBreed> breeds = catBreedFromJson(body);
    return breeds;
  }
}
