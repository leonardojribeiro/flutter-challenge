class DogCategoryModel {
  final num? id;
  final String? name;
  DogCategoryModel({
    this.id,
    this.name,
  });

  factory DogCategoryModel.fromMap(Map<String, dynamic> map) {
    return DogCategoryModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
