import 'package:go_router/go_router.dart';

import 'presentation.dart';

final router = GoRouter(initialLocation: '/todos', routes: [
  GoRoute(
      path: '/todos',
      builder: (context, state) => const TodosList(),
      routes: [
        GoRoute(path: 'new', builder: (context, state) => const TodosNew()),
      ]),
]);
