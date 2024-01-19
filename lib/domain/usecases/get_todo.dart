import '../model/model.dart';

abstract class GetTodoUseCase {
  Future<Todo?> execute(String id);
}
