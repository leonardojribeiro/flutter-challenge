import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/dogs/dogs_state.dart';
import 'package:flutter_challenge/modules/dogs/models/dog_model.dart';
import 'package:flutter_challenge/modules/dogs/use_cases/show_dog/show_dog_wiget.dart';
import 'package:flutter_challenge/shared/widgets/image_widget.dart';
import 'package:flutter_challenge/shared/widgets/loading_widget.dart';
import 'package:flutter_challenge/shared/widgets/slivers_list_widget.dart';
import 'package:get_it/get_it.dart';

class FindDogsWidget extends StatefulWidget {
  const FindDogsWidget({Key? key}) : super(key: key);

  @override
  State<FindDogsWidget> createState() => _FindDogsWidgetState();
}

class _FindDogsWidgetState extends State<FindDogsWidget> {
  final dogsState = GetIt.I.get<DogsState>();
  @override
  void initState() {
    if (dogsState.value.pets == null) {
      dogsState.requestFirstPage();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DogsStateValue>(
      valueListenable: dogsState,
      builder: (context, value, child) {
        return SliversListWidget(
          onEndScroll: dogsState.requestNextPage,
          onRefresh: dogsState.requestFirstPage,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final dog = value.pets?[index] ?? DogModel();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Hero(
                      tag: dog.id ?? '',
                      child: ImageWidget(
                        pet: dog,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ShowDogWidget(
                                dog: dog,
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
            ),
            if (value.isLoading) const LoadingWidget(),
          ],
        );
      },
    );
  }
}
