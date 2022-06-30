import 'package:flutter_challenge/modules/cats/cats_repository.dart';

import 'package:flutter_challenge/modules/cats/models/cat_model.dart';
import 'package:flutter_challenge/shared/states/base_pet_state.dart';

class CatsState extends BasePetState<CatModel, CatsRepository> {}

typedef CatsStateValue = PetsStateValue<CatModel>;
