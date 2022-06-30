import 'package:flutter/material.dart';

import 'package:flutter_challenge/shared/models/pet_model.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    Key? key,
    required this.pet,
    this.onPressed,
  }) : super(key: key);
  final PetModel pet;
  final VoidCallback? onPressed;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: widget.onPressed,
      child: Image.network(
        widget.pet.url ?? '',
        fit: BoxFit.contain,
        loadingBuilder: (context, child, ev) {
          if (ev == null) {
            return child;
          }
          return Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Carregando imagem...'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
