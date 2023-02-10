import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../models/todo_model.dart';

class TodosApiServices {
  String endpoint = 'https://jsonplaceholder.typicode.com/todos/1';

  Future<TodoModel> getTodo() async {
    // just to simulate network delay
    // await Future.delayed(Duration(seconds: 3), () => print('waited 3 seconds'));

    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return TodoModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final todosApiServicesProvider = Provider<TodosApiServices>((ref) => TodosApiServices());

final todoModelProvider = FutureProvider<TodoModel>((ref) async {
  return ref.watch(todosApiServicesProvider).getTodo();
});
