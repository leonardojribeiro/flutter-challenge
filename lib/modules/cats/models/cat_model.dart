import 'package:flutter_challenge/modules/cats/models/cat_breed_model.dart';
import 'package:flutter_challenge/modules/cats/models/cat_category_model.dart';
import 'package:flutter_challenge/shared/models/pet_model.dart';

class CatModel extends PetModel {
  final List<CatCategoryModel>? categories;
  final List<CatBreedModel>? breeds;

  CatModel({
    String? id,
    String? url,
    num? width,
    num? height,
    this.categories,
    this.breeds,
  }) : super(id: id, url: url, width: width, height: height);

  factory CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(
      id: map['id'],
      url: map['url'],
      width: map['width'],
      height: map['height'],
      categories: map['categories'] != null ? List<CatCategoryModel>.from(map['categories']?.map((x) => CatCategoryModel.fromMap(x))) : null,
      breeds: map['breeds'] != null ? List<CatBreedModel>.from(map['breeds']?.map((x) => CatBreedModel.fromMap(x))) : null,
    );
  }
}
