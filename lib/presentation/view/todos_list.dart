import 'package:flutter/material.dart';
import 'package:flutter_clean_todo_app/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('todos'),
      ),
    );
  }
}
