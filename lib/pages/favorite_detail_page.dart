import 'package:flutter/material.dart';

class FavoriteDetailPage extends StatelessWidget {
  const FavoriteDetailPage(this.name, {super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Favorite Detail')),
        body: Center(child: Text(name, style: Theme.of(context).primaryTextTheme.bodyLarge)));
  }


}
