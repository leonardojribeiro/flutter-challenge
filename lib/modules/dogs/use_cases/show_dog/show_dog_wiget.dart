import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/dogs/models/dog_model.dart';
import 'package:flutter_challenge/shared/widgets/show_pet_widget.dart';

class ShowDogWidget extends StatelessWidget {
  const ShowDogWidget({
    Key? key,
    required this.dog,
  }) : super(key: key);
  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do cachorro'),
      ),
      body: ShowPetWidget(
        pet: dog,
        summary: dog.categories?.isNotEmpty == true || dog.breeds?.isNotEmpty == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (dog.categories?.isNotEmpty == true)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Categorias:'),
                    ),
                  if (dog.categories?.isNotEmpty == true)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: dog.categories
                                ?.map((e) => Chip(
                                      label: Text(e.name ?? ''),
                                    ))
                                .toList() ??
                            [],
                      ),
                    ),
                  if (dog.categories?.isNotEmpty == true && dog.breeds?.isNotEmpty == true) const Divider(),
                  if (dog.breeds?.isNotEmpty == true)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Raças:'),
                    ),
                  if (dog.breeds?.isNotEmpty == true)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: dog.breeds
                                ?.map((e) => Chip(
                                      label: Text(e.name ?? ''),
                                    ))
                                .toList() ??
                            [],
                      ),
                    ),
                ],
              )
            : const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Este cachorro não possui informações adicionais.'),
              ),
      ),
    );
  }
}
