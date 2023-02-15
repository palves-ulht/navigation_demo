import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'favorite_model.dart';

class FavoritesModel {
  const FavoritesModel(this.favorites);
  final List<FavoriteModel> favorites;
}

class FavoritesModelNotifier extends StateNotifier<FavoritesModel> {
  FavoritesModelNotifier() : super(FavoritesModel(List.empty()));

  void add(FavoriteModel favoriteModel) {
    final mutableFavorites = state.favorites.toList();  // first change fixed-length list to growable list
    mutableFavorites.add(favoriteModel);
    state = FavoritesModel(mutableFavorites);
  }

  void update(int index, FavoriteModel favoriteModel) {
    final mutableFavorites = state.favorites.toList();  // first change fixed-length list to growable list
    mutableFavorites[index] = favoriteModel;
    state = FavoritesModel(mutableFavorites);
  }
}

final favoritesModelProvider = StateNotifierProvider<FavoritesModelNotifier, FavoritesModel>((ref) => FavoritesModelNotifier());