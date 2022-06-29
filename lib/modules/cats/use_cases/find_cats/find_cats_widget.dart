import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/cats/cats_state.dart';
import 'package:flutter_challenge/modules/cats/models/cat_model.dart';
import 'package:flutter_challenge/shared/widgets/image_widget.dart';
import 'package:flutter_challenge/shared/widgets/slivers_list_widget.dart';
import 'package:get_it/get_it.dart';

class FindCatsWidget extends StatefulWidget {
  const FindCatsWidget({Key? key}) : super(key: key);

  @override
  State<FindCatsWidget> createState() => _FindCatsWidgetState();
}

class _FindCatsWidgetState extends State<FindCatsWidget> {
  final catsState = GetIt.I.get<CatsState>();
  @override
  void initState() {
    if (catsState.value.cats == null) {
      catsState.requestFirstPage();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CatStateValue>(
      valueListenable: catsState,
      builder: (context, value, child) {
        return SliversListWidget(
          onEndScroll: catsState.requestNextPage,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final cat = value.cats?[index] ?? CatModel();
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ImageWidget(pet: cat),
                  );
                },
                childCount: value.cats?.length ?? 0,
              ),
            )
          ],
        );
      },
    );
  }
}
