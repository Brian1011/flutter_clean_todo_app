import '../model/model.dart';
import '../repository/repository.dart';
import 'delete_todo.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  final TodosRepository repository;

  DeleteTodoUseCaseImpl(this.repository);

  @override
  Future<void> execute(Todo todo) => repository.deleteTodo(todo);
}
