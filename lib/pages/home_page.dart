import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Home $_counter', style: Theme.of(context).primaryTextTheme.bodyLarge)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _counter++),
        child: Text('+', textScaleFactor: 2.0,),
      ),
    );
  }
}
