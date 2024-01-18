import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_clean_todo_app/data/source/files.dart';

import '../../domain/domain.dart';

class TodosRepositoryImpl extends TodosRepository {
  final Files files;
  late final String path = 'todos.json';

  TodosRepositoryImpl(this.files);
  @override
  Future<void> deleteAllTodos() async {
    await files.delete(path);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todos = await loadTodos();
    final newTodos =
        todos.values.where((element) => element.id != todo.id).toList();
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    Todos todos = await loadTodos();
    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<Todos> loadTodos() async {
    // load the todos from path
    final content = await files.read(path);
    if (content == null) return const Todos(values: []);

    // transform it to json and then the todos list
    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();
    final newTodos =
        todos.values.where((element) => element.id != todo.id).toList();
    newTodos.add(todo);
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }
}
