import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        ),
        AutoRoute(
          page: SigninRoute.page,
          path: '/signin',
        ),
        AutoRoute(page: SignupRoute.page, path: '/signup', initial: true),
      ];
}
