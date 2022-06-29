import 'package:flutter_challenge/modules/dogs/models/dog_breed_model.dart';
import 'package:flutter_challenge/modules/dogs/models/dog_category_model.dart';
import 'package:flutter_challenge/shared/models/pet_model.dart';

class DogModel extends PetModel {
  final List<DogCategoryModel>? categories;
  final List<DogBreedModel>? breeds;

  DogModel({
    String? id,
    String? url,
    num? width,
    num? height,
    this.categories,
    this.breeds,
  }) : super(id: id, url: url, width: width, height: height);

  factory DogModel.fromMap(Map<String, dynamic> map) {
    return DogModel(
      id: map['id'],
      url: map['url'],
      width: map['width'],
      height: map['height'],
      categories: map['categories'] != null ? List<DogCategoryModel>.from(map['categories']?.map((x) => DogCategoryModel.fromMap(x))) : null,
      breeds: map['breeds'] != null ? List<DogBreedModel>.from(map['breeds']?.map((x) => DogBreedModel.fromMap(x))) : null,
    );
  }
}
