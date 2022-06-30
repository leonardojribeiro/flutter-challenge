import 'package:flutter_challenge/shared/models/pet_model.dart';

abstract class BasePetRepository<T extends PetModel> {
  Future<List<T>?> findPets({required int page, required int limit});
}
