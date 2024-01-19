import 'package:flutter_clean_todo_app/domain/model/todo.dart';

import '../repository/repository.dart';
import 'get_todo.dart';

class GetTodoUseCaseImpl extends GetTodoUseCase {
  final TodosRepository repository;

  GetTodoUseCaseImpl(this.repository);

  @override
  Future<Todo?> execute(String id) => repository.getTodoById(id);
}
