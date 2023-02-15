import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_demo/pages/favorite_detail_page.dart';

import '../models/favorite_model.dart';
import '../models/favorites_model.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {

  final formKey = GlobalKey<FormState>();

  String? _name = '';
  String? _email = '';

  @override
  Widget build(BuildContext context) {
    final favoritesModel = ref.watch(favoritesModelProvider);

    return Scaffold(
        appBar: AppBar(title: Text('Favorites')),
        body: Center(
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(32),
              children: [
                buildNameField(),
                SizedBox(height: 24),
                buildEmailField(),
                SizedBox(height: 24),
                buildSubmitButton(),
                SizedBox(height: 24),
                buildNamesList(favoritesModel),
              ],
            ),
          ),
        ));
  }

  Widget buildSubmitButton() => ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();  // hide keyboard
          final isValid = formKey.currentState?.validate() ?? true;
          if (isValid) {
            formKey.currentState?.save();
            formKey.currentState?.reset();  // clear the form
            ref.read(favoritesModelProvider.notifier).add(FavoriteModel(name: _name!, email: _email!));
          }
        },
        child: Text('Submit'),
      );

  Widget buildNameField() => TextFormField(
        decoration: InputDecoration(labelText: 'Name', prefixIcon: Icon(Icons.favorite)),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onSaved: (value) => setState(() => _name = value),
        validator: (value) => value == null || value.isEmpty ? 'Please fill in the name' : null
      );

  Widget buildEmailField() => TextFormField(
        decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        onSaved: (value) => setState(() => _email = value),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill in the email';
          } else if (value.length < 7) {
            return 'Email must have at least 7 characters';
          } else {
            return null;
          }
        },
      );

  Widget buildNamesList(FavoritesModel model) => Column(
        children: model.favorites.mapIndexed((index, favorite) => listEntry(index, favorite)).toList(),
      );

  Widget listEntry(int index, FavoriteModel favoriteModel) => Card(
        child: ListTile(
          title: Text(favoriteModel.name),
          subtitle: Text(favoriteModel.email),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () =>
            // have to push the index instead of the model, since we want to possibly change it inside FavoriteDetailPage
            // and in that case, we have to get the reference through the riverpod provider
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoriteDetailPage(index))),
        ),
      );
}
