import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shortid/shortid.dart';

import '../../domain/domain.dart';

class TodosNew extends ConsumerStatefulWidget {
  const TodosNew({super.key});

  @override
  _TodosNewState createState() => _TodosNewState();
}

class _TodosNewState extends ConsumerState<TodosNew> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isCompleted = false;
  final formKey = GlobalKey<FormState>();
  late final saveTodoUseCase = ref.read(saveTodoProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Todo'),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  SwitchListTile(
                    title: const Text('Completed'),
                    value: isCompleted,
                    onChanged: (value) {
                      if (mounted) {
                        setState(() {
                          isCompleted = value;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              final todo = Todo(
                id: shortid.generate(),
                title: titleController.text,
                description: descriptionController.text,
                completed: isCompleted,
              );

              final messenger = ScaffoldMessenger.of(context);
              final router = GoRouter.of(context);
              await saveTodoUseCase.execute(todo);
              messenger.toast('Todo saved');
              if (router.canPop()) router.pop();
            }
          },
          tooltip: 'Save Todo',
          icon: const Icon(Icons.save),
          label: const Text('Save Todo'),
        ));
  }
}

extension on ScaffoldMessengerState {
  void toast(String message) {
    showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
