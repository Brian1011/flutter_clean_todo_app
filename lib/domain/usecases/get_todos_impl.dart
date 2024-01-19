import '../../domain/domain.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  final TodosRepository todosRepository;
  GetTodosUseCaseImpl(this.todosRepository);

  @override
  Future<Todos> execute() => todosRepository.loadTodos();
}
