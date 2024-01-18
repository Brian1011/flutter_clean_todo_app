import 'package:go_router/go_router.dart';

import 'presentation.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      redirect: (context, state) => '/todos',
      routes: [
        GoRoute(path: 'todos', builder: (context, state) => const TodosList())
      ]),
]);
