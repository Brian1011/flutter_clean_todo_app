import 'package:flutter_clean_todo_app/domain/domain.dart';

class SaveTodoUseCaseImpl implements SaveTodoUseCase {
  final TodosRepository repository;

  SaveTodoUseCaseImpl(this.repository);

  @override
  Future<void> execute(Todo todo) {
    return repository.saveTodo(todo);
  }
}
