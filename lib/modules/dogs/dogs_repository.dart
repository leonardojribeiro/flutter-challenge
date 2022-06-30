import 'package:flutter_challenge/modules/dogs/models/dog_model.dart';
import 'package:flutter_challenge/services/api/api_service.dart';
import 'package:flutter_challenge/shared/repositories/base_pet_repository.dart';
import 'package:get_it/get_it.dart';

class DogsRepository implements BasePetRepository<DogModel> {
  final _apiService = GetIt.I.get<ApiService>();
  final _apiKey = "32eca0e9-3b9e-4392-be49-c4b55310f24f";

  @override
  Future<List<DogModel>?> findPets({required int page, required int limit}) async {
    final response = await _apiService.get(
      url: 'https://api.thedogapi.com/v1/images/search',
      queryParamters: {
        'page': page,
        'limit': limit,
        'order': 'desc',
      },
      headers: {
        'x-api-key': _apiKey,
      },
    );
    if (response is List) {
      return response.map((e) => DogModel.fromMap(e)).toList();
    }
    return null;
  }
}
