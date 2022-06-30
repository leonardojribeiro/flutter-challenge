class DogBreedModel {
  final num? id;
  final String? name;
  DogBreedModel({
    this.id,
    this.name,
  });

  factory DogBreedModel.fromMap(Map<String, dynamic> map) {
    return DogBreedModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
