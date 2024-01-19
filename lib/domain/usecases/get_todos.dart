import '../model/model.dart';

abstract class GetTodosUseCase {
  Future<Todos> execute();
}
