import 'package:flutter/material.dart';
import 'package:flutter_clean_todo_app/presentation/viewmodel/module.dart';
import 'package:flutter_clean_todo_app/presentation/widgets/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosListState);
    final model = ref.watch(todoListModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('todos'),
      ),
      body: ListView.builder(
        itemCount: todos.values.length,
        itemBuilder: (context, index) {
          final todo = todos.values[index];
          return CheckboxListTile(
            title: Text(todo.title),
            subtitle: todo.description != null ? Text(todo.description!) : null,
            value: todo.completed,
            onChanged: (value) async {
              if (value != null) {
                final messenger = ScaffoldMessenger.of(context);
                final newTodo = todo.copyWith(completed: value);
                await model.save(newTodo);
                messenger.toast('Todo saved');
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/todos/new');
        },
        tooltip: 'Add Todo',
        icon: const Icon(Icons.add),
        label: const Text('Add Todo'),
      ),
    );
  }
}
