import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/domain.dart';

part 'module.g.dart';

final todoListNotifier = ChangeNotifierProvider<ValueNotifier<Todos>>(
    (ref) => ValueNotifier(const Todos(values: [])));

@riverpod
Future<Todos> todosList(TodosListRef ref) async {
  final usecase = ref.watch(getTodosProvider);
  final items = await usecase.execute();
  return items;
}
