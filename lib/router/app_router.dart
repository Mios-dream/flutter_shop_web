import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: <RouteBase>[
      GoRoute(
        name: 'loginPage',
        path: '/loginPage',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'homePage',
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
