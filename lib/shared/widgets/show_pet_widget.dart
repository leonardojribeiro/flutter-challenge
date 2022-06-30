import 'package:flutter/material.dart';

import 'package:flutter_challenge/shared/models/pet_model.dart';
import 'package:flutter_challenge/shared/widgets/image_widget.dart';

class ShowPetWidget extends StatelessWidget {
  const ShowPetWidget({
    Key? key,
    required this.pet,
    required this.summary,
  }) : super(key: key);
  final PetModel pet;
  final Widget summary;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.blurBackground, StretchMode.zoomBackground],
            background: Hero(
              tag: pet.id ?? '',
              child: ImageWidget(
                pet: pet,
              ),
            ),
          ),
          expandedHeight: size.height - 192,
          stretch: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        SliverToBoxAdapter(
          child: Card(
            child: Padding(padding: const EdgeInsets.all(8.0), child: summary),
          ),
        ),
      ],
    );
  }
}
