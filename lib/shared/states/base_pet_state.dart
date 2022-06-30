import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/models/pet_model.dart';
import 'package:flutter_challenge/shared/repositories/base_pet_repository.dart';
import 'package:get_it/get_it.dart';

abstract class BasePetState<TM extends PetModel, TR extends BasePetRepository<TM>> extends ValueNotifier<PetsStateValue<TM>> {
  BasePetState()
      : super(
          PetsStateValue<TM>(
            page: 0,
            isLastPage: false,
          ),
        );

  final _repository = GetIt.I.get<TR>();

  final _limit = 20;

  void reset() {
    value = PetsStateValue<TM>(
      isLastPage: false,
      page: 0,
      pets: null,
    );
  }

  Future<List<TM>?> _request({required int page}) async {
    return _repository.findPets(
      page: page,
      limit: _limit,
    );
  }

  Future<void> requestFirstPage() async {
    final pets = await _request(page: 0);
    value = PetsStateValue<TM>(
      pets: pets,
      page: 1,
      isLastPage: (pets?.length ?? 0) < _limit,
    );
    notifyListeners();
  }

  Future<void> requestNextPage() async {
    if (!value.isLastPage) {
      final pets = await _request(
        page: value.page,
      );
      value = value.copyWith(
        pets: [...value.pets ?? [], ...pets ?? []],
        page: value.page + 1,
        isLastPage: (pets?.length ?? 0) < _limit,
      );
      notifyListeners();
    }
  }
}

class PetsStateValue<TM> {
  final List<TM>? pets;
  final int page;
  final bool isLastPage;
  PetsStateValue({
    this.pets,
    required this.page,
    required this.isLastPage,
  });

  PetsStateValue<TM> copyWith({
    List<TM>? pets,
    int? page,
    bool? isLastPage,
  }) {
    return PetsStateValue(
      pets: pets ?? this.pets,
      page: page ?? this.page,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  String toString() {
    return 'PetsStateValue(pets: $pets, page: $page, isLastPage: $isLastPage)';
  }
}
