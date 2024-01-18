import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';

part 'module.g.dart';

@riverpod
Future<Todos> getTodos(GetTodosRef ref) async {
  final todos = ref.watch(todosProvider);
  return todos.loadTodos();
}
