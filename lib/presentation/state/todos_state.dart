import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'todos_state.freezed.dart';
part 'todos_state.g.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.loading() = loading;
  const factory TodoState.ready(Todos todos) = _loaded;
  const factory TodoState.error({String? message}) = _Error;

  factory TodoState.fromJson(Map<String, Object?> json) =>
      _$TodoStateFromJson(json);
}
