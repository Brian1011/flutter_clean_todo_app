import '../model/model.dart';

abstract class SaveTodoUseCase {
  Future<void> execute(Todo todo);
}
