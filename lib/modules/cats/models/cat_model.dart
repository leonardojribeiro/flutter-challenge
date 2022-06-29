import 'package:flutter_challenge/modules/cats/models/cat_breed_model.dart';
import 'package:flutter_challenge/modules/cats/models/cat_category_model.dart';

class CatModel {
  final String? id;
  final List<CatCategoryModel>? categories;
  final List<CatBreedModel>? breeds;

  CatModel({
    this.id,
    this.categories,
    this.breeds,
  });

  factory CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(
      id: map['id'],
      categories: map['categories'] != null ? List<CatCategoryModel>.from(map['categories']?.map((x) => CatCategoryModel.fromMap(x))) : null,
      breeds: map['breeds'] != null ? List<CatBreedModel>.from(map['breeds']?.map((x) => CatBreedModel.fromMap(x))) : null,
    );
  }
}
