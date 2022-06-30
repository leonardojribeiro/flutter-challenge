import 'package:flutter_challenge/modules/dogs/dogs_repository.dart';
import 'package:flutter_challenge/modules/dogs/models/dog_model.dart';
import 'package:flutter_challenge/shared/states/base_pet_state.dart';

class DogsState extends BasePetState<DogModel, DogsRepository> {}

typedef DogsStateValue = PetsStateValue<DogModel>;
