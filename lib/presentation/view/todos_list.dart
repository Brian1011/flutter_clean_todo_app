import 'package:flutter/material.dart';
import 'package:flutter_clean_todo_app/presentation/viewmodel/module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(getTodosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('todos'),
      ),
      body: todos.map(
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error) => Center(
          child: Text(error.stackTrace.toString()),
        ),
        data: (todos) => ListView.builder(
          itemCount: todos.value.values.length,
          itemBuilder: (context, index) {
            final todo = todos.value.values[index];
            return ListTile(
              title: Text(todo.title),
              subtitle:
                  todo.description != null ? Text(todo.description!) : null,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/todos/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
