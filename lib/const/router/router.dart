import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  // final LoginDbService loginDbService;

  // AppRouter({super.navigatorKey, required this.loginDbService});
  @override
  late final List<AutoRoute> routes = [
    AdaptiveRoute(page: SplashRoute.page, path: '/splash', initial: true),
    AdaptiveRoute(
      page: SigninRoute.page,
      path: '/signin',
    ),
    AdaptiveRoute(page: SignupRoute.page, path: '/signup'),
    AdaptiveRoute(page: HomeRoute.page, path: '/home'),
    AdaptiveRoute(page: ProfileRoute.page, path: '/profile'),
    AdaptiveRoute(page: CreateTasksRoute.page, path: '/tasks'),
  ];
}
