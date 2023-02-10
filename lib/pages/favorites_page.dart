import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_demo/pages/favorite_detail_page.dart';

import '../models/favorites_model.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    final favoritesModel = ref.watch(favoritesModelProvider);

    return Scaffold(
        appBar: AppBar(title: Text('Favorites')),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              buildNameField(),
              SizedBox(height: 24),
              buildSubmitButton(),
              SizedBox(height: 24),
              buildNamesList(favoritesModel),
            ],
          ),
        ));
  }

  Widget buildSubmitButton() => ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          ref.read(favoritesModelProvider.notifier).add(_name);
        },
        child: Text('Submit'),
      );

  Widget buildNameField() => TextField(
        decoration: InputDecoration(labelText: 'Name', prefixIcon: Icon(Icons.favorite)),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onChanged: (value) => setState(() => _name = value),
      );

  Widget buildNamesList(FavoritesModel model) => Column(
        children: model.names.map((name) => listEntry(name)).toList(),
      );

  Widget listEntry(String name) => Card(
        child: ListTile(
          title: Text(name),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoriteDetailPage(name))),
        ),
      );
}
