import '../model/model.dart';

abstract class DeleteTodoUseCase {
  Future<void> execute(Todo todo);
}
