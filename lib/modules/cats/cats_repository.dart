import 'package:flutter_challenge/modules/cats/models/cat_model.dart';
import 'package:flutter_challenge/services/api/api_service.dart';
import 'package:flutter_challenge/shared/repositories/base_pet_repository.dart';
import 'package:get_it/get_it.dart';

class CatsRepository implements BasePetRepository<CatModel> {
  final _apiService = GetIt.I.get<ApiService>();
  final _apiKey = "96ac3ae8-12e0-481a-b243-42672ebeed8e";

  @override
  Future<List<CatModel>?> findPets({required int page, required int limit}) async {
    final response = await _apiService.get(
      url: 'https://api.thecatapi.com/v1/images/search',
      queryParamters: {
        'page': page,
        'limit': limit,
        'order': 'DESC',
      },
      headers: {
        'x-api-key': _apiKey,
      },
    );
    if (response is List) {
      return response.map((e) => CatModel.fromMap(e)).toList();
    }
    return null;
  }
}
