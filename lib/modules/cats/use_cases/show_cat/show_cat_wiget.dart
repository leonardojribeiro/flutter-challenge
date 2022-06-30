import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/cats/models/cat_model.dart';
import 'package:flutter_challenge/shared/widgets/show_pet_widget.dart';

class ShowCatWidget extends StatelessWidget {
  const ShowCatWidget({
    Key? key,
    required this.cat,
  }) : super(key: key);
  final CatModel cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do gato'),
      ),
      body: ShowPetWidget(
        pet: cat,
        summary: cat.categories?.isNotEmpty == true || cat.breeds?.isNotEmpty == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (cat.categories?.isNotEmpty == true)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Categorias:'),
                    ),
                  if (cat.categories?.isNotEmpty == true)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: cat.categories
                                ?.map((e) => Chip(
                                      label: Text(e.name ?? ''),
                                    ))
                                .toList() ??
                            [],
                      ),
                    ),
                  if (cat.categories?.isNotEmpty == true && cat.breeds?.isNotEmpty == true) const Divider(),
                  if (cat.breeds?.isNotEmpty == true)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Raças:'),
                    ),
                  if (cat.breeds?.isNotEmpty == true)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: cat.breeds
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
                child: Text('Este gato não possui informações adicionais.'),
              ),
      ),
    );
  }
}
