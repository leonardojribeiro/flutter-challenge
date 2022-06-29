class CatCategoryModel {
  final num? id;
  final String? name;
  CatCategoryModel({
    this.id,
    this.name,
  });

  factory CatCategoryModel.fromMap(Map<String, dynamic> map) {
    return CatCategoryModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
