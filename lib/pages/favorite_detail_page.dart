import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_demo/models/favorite_model.dart';
import 'package:navigation_demo/models/favorites_model.dart';

class FavoriteDetailPage extends ConsumerStatefulWidget {
  const FavoriteDetailPage(this.favoritesIndex, {super.key});

  final int favoritesIndex;

  @override
  ConsumerState<FavoriteDetailPage> createState() => _FavoriteDetailPageState(favoritesIndex);
}

class _FavoriteDetailPageState extends ConsumerState<FavoriteDetailPage> {

  bool editMode = false;
  String _name = '';
  final int favoritesIndex;

  _FavoriteDetailPageState(this.favoritesIndex);

  @override
  Widget build(BuildContext context) {

    final favoritesModel = ref.watch(favoritesModelProvider);
    final selectedFavoriteModel = favoritesModel.favorites[favoritesIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Favorite Detail')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              editMode
                  ? TextFormField(
                      initialValue: selectedFavoriteModel.name,
                      onChanged: (value) => setState(() => _name = value),
                    )
                  : Text(selectedFavoriteModel.name, style: Theme.of(context).primaryTextTheme.bodyLarge),
              ElevatedButton(
                onPressed: () {
                  if (!editMode) {
                    setState(() => editMode = true);
                  } else {
                    // user pressed submit
                    ref.read(favoritesModelProvider.notifier)
                        .update(favoritesIndex, FavoriteModel(name: _name, email: selectedFavoriteModel.email));
                    Navigator.of(context).pop();
                  }
                },
                child: Text(!editMode ? 'edit' : 'submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
