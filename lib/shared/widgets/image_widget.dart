import 'package:flutter/material.dart';

import 'package:flutter_challenge/shared/models/pet_model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.pet,
  }) : super(key: key);
  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        width: pet.width?.toDouble(),
        height: pet.height?.toDouble(),
        child: Image.network(
          pet.url ?? '',
          fit: BoxFit.contain,
          width: pet.width?.toDouble(),
          height: pet.height?.toDouble(),
        ),
      ),
    );
  }
}
