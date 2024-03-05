import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';

final todoListNotifier = ChangeNotifierProvider<ValueNotifier<Todos>>(
    (ref) => ValueNotifier(const Todos(values: [])));

class TodosStateNotifier extends StateNotifier<Todos> {
  TodosStateNotifier(this.ref) : super(const Todos(values: [])) {
    loadTodos();
  }

  final Ref ref;
  late final getTodos = ref.read(getTodosProvider);

  Future<void> loadTodos() async {
    state = await getTodos.execute();
  }
}

final todosListState = StateNotifierProvider<TodosStateNotifier, Todos>(
    (ref) => TodosStateNotifier(ref));

final todoListModel =
    Provider<TodosStateNotifier>((ref) => ref.watch(todosListState.notifier));
