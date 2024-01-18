import 'package:flutter/material.dart';
import 'package:flutter_clean_todo_app/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: TodosApp()));
}
