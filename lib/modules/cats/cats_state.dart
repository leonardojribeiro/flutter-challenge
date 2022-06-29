import 'package:flutter/foundation.dart';
import 'package:flutter_challenge/modules/cats/cats_repository.dart';

import 'package:flutter_challenge/modules/cats/models/cat_model.dart';
import 'package:get_it/get_it.dart';

class CatState extends ValueNotifier<CatStateValue> {
  CatState()
      : super(CatStateValue(
          page: 0,
          isLastPage: false,
        ));

  final repository = GetIt.I.get<CatsRepository>();

  final limit = 20;

  void reset() {
    value = CatStateValue(
      isLastPage: false,
      page: 0,
      cats: null,
    );
  }

  Future<List<CatModel>?> request({required int page}) async {
    return repository.findCats(
      page: page,
      limit: limit,
    );
  }

  Future<void> requestFirstPage() async {
    final cats = await request(page: 0);
    value = CatStateValue(
      cats: cats,
      page: 1,
      isLastPage: (cats?.length ?? 0) < limit,
    );
  }

  Future<void> requestNextPage() async {
    if (!value.isLastPage) {
      final cats = await request(
        page: value.page,
      );
      value = value.copyWith(
        cats: [...value.cats ?? [], ...cats ?? []],
        page: value.page + 1,
        isLastPage: (cats?.length ?? 0) < limit,
      );
    }
  }
}

class CatStateValue {
  final List<CatModel>? cats;
  final int page;
  final bool isLastPage;
  CatStateValue({
    this.cats,
    required this.page,
    required this.isLastPage,
  });

  CatStateValue copyWith({
    List<CatModel>? cats,
    int? page,
    bool? isLastPage,
  }) {
    return CatStateValue(
      cats: cats ?? this.cats,
      page: page ?? this.page,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  String toString() {
    return 'CatStateValue(cats: $cats, page: $page, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CatStateValue && listEquals(other.cats, cats) && other.page == page && other.isLastPage == isLastPage;
  }

  @override
  int get hashCode {
    return cats.hashCode ^ page.hashCode ^ isLastPage.hashCode;
  }
}
