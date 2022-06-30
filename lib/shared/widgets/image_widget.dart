import 'package:flutter/material.dart';

import 'package:flutter_challenge/shared/models/pet_model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.pet,
    this.onPressed,
  }) : super(key: key);
  final PetModel pet;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.network(
        pet.url ?? '',
        fit: BoxFit.contain,
      ),
    );
  }
}
