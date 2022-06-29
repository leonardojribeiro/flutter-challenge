import 'dart:convert';

class PetModel {
  final String? id;
  final String? url;
  final num? width;
  final num? height;

  PetModel({
    this.id,
    this.url,
    this.width,
    this.height,
  });

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id'],
      url: map['url'],
      width: map['width'],
      height: map['height'],
    );
  }
}
