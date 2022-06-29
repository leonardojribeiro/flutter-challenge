import 'package:flutter/foundation.dart';

import 'package:flutter_challenge/modules/dogs/dogs_repository.dart';
import 'package:flutter_challenge/modules/dogs/models/dog_model.dart';
import 'package:get_it/get_it.dart';

class DogsState extends ValueNotifier<DogsStateValue> {
  DogsState()
      : super(
          DogsStateValue(
            page: 0,
            isLastPage: false,
          ),
        );

  final repository = GetIt.I.get<DogsRepository>();

  final limit = 20;

  void reset() {
    value = DogsStateValue(
      isLastPage: false,
      page: 0,
      dogs: null,
    );
  }

  Future<List<DogModel>?> request({required int page}) async {
    return repository.findCats(
      page: page,
      limit: limit,
    );
  }

  Future<void> requestFirstPage() async {
    final dogs = await request(page: 0);
    value = DogsStateValue(
      dogs: dogs,
      page: 1,
      isLastPage: (dogs?.length ?? 0) < limit,
    );
    notifyListeners();
  }

  Future<void> requestNextPage() async {
    if (!value.isLastPage) {
      final dogs = await request(
        page: value.page,
      );
      value = value.copyWith(
        dogs: [...value.dogs ?? [], ...dogs ?? []],
        page: value.page + 1,
        isLastPage: (dogs?.length ?? 0) < limit,
      );
      notifyListeners();
    }
  }
}

class DogsStateValue {
  final List<DogModel>? dogs;
  final int page;
  final bool isLastPage;
  DogsStateValue({
    this.dogs,
    required this.page,
    required this.isLastPage,
  });

  DogsStateValue copyWith({
    List<DogModel>? dogs,
    int? page,
    bool? isLastPage,
  }) {
    return DogsStateValue(
      dogs: dogs ?? this.dogs,
      page: page ?? this.page,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  String toString() {
    return 'DogsStateValue(dogs: $dogs, page: $page, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DogsStateValue && listEquals(other.dogs, dogs) && other.page == page && other.isLastPage == isLastPage;
  }

  @override
  int get hashCode {
    return dogs.hashCode ^ page.hashCode ^ isLastPage.hashCode;
  }
}
