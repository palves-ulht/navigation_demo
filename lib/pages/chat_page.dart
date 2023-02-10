import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_demo/services/todos_api_services.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _todoModel = ref.watch(todoModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: _todoModel.when(
          data: (_data) {
            return Center(child: Text(_data.title,
                style: Theme
                    .of(context)
                    .primaryTextTheme
                    .bodyLarge));
          },
          error: (err, stack) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator())
      ),
    );
  }
}
