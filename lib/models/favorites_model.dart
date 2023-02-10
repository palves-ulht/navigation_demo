import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesModel {
  const FavoritesModel(this.names);
  final List<String> names;
}

class FavoritesModelNotifier extends StateNotifier<FavoritesModel> {
  FavoritesModelNotifier() : super(FavoritesModel(List.empty()));

  void add(String name) {
    final mutableNames = state.names.toList();  // first change fixed-length list to growable list
    mutableNames.add(name);
    state = FavoritesModel(mutableNames);
  }
}

final favoritesModelProvider = StateNotifierProvider<FavoritesModelNotifier, FavoritesModel>((ref) => FavoritesModelNotifier());