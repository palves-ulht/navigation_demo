import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_demo/models/favorites_model.dart';

class PersonPage extends ConsumerWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favoritesModel = ref.watch(favoritesModelProvider);
    final firstName = favoritesModel.names.isEmpty ? "" : favoritesModel.names[favoritesModel.names.length-1];

    return Scaffold(
        appBar: AppBar(title: Text('Person')),
        body: Center(child: Text('Person $firstName', style: Theme.of(context).primaryTextTheme.bodyLarge)));
  }
}
