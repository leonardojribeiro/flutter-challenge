class CatBreedModel {
  final String? id;
  final String? name;
  CatBreedModel({
    this.id,
    this.name,
  });

  factory CatBreedModel.fromMap(Map<String, dynamic> map) {
    return CatBreedModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
