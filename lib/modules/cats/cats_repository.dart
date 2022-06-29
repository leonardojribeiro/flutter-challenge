import 'package:flutter_challenge/modules/cats/models/cat_model.dart';
import 'package:flutter_challenge/services/api/api_service.dart';
import 'package:get_it/get_it.dart';

class CatsRepository {
  final _apiService = GetIt.I.get<ApiService>();
  final _apiKey = "96ac3ae8-12e0-481a-b243-42672ebeed8e";

  Future<List<CatModel>?> findCats({required int page, required int limit}) async {
    final response = await _apiService.get(
      url: 'https://api.thecatapi.com/v1/images',
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
