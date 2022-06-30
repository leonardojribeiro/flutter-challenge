import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/cats/cats_state.dart';
import 'package:flutter_challenge/modules/cats/models/cat_model.dart';
import 'package:flutter_challenge/modules/cats/use_cases/show_cat/show_cat_wiget.dart';
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
    if (catsState.value.pets == null) {
      catsState.requestFirstPage();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CatsStateValue>(
      valueListenable: catsState,
      builder: (context, value, child) {
        return SliversListWidget(
          onEndScroll: catsState.requestNextPage,
          onRefresh: catsState.requestFirstPage,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final cat = value.pets?[index] ?? CatModel();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Hero(
                      tag: cat.id ?? '',
                      child: ImageWidget(
                        pet: cat,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ShowCatWidget(
                                cat: cat,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                childCount: value.pets?.length ?? 0,
              ),
            )
          ],
        );
      },
    );
  }
}
