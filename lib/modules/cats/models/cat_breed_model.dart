class CatBreedModel {
  final String? id;
  final String? name;
  final String? temperament;
  final String? lifeSpan;
  final String? altNames;
  final String? wikipediaUrl;
  final String? origin;
  final String? weightImperial;
  final num? experimental;
  CatBreedModel({
    this.id,
    this.name,
    this.temperament,
    this.lifeSpan,
    this.altNames,
    this.wikipediaUrl,
    this.origin,
    this.weightImperial,
    this.experimental,
  });

  factory CatBreedModel.fromMap(Map<String, dynamic> map) {
    return CatBreedModel(
      id: map['id'],
      name: map['name'],
      temperament: map['temperament'],
      lifeSpan: map['life_span'],
      altNames: map['alt_names'],
      wikipediaUrl: map['wikipedia_url'],
      origin: map['original_url'],
      weightImperial: map['weight_imperial'],
      experimental: map['experimental'],
    );
  }
}
